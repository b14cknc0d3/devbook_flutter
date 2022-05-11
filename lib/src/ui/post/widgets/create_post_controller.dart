import 'dart:convert';

import 'package:appwrite/models.dart';
import 'package:devbook/src/api/appwrite_client.dart';
import 'package:devbook/src/constant/constant.dart';
import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/post.dart';

class CreatePostController extends GetxController with StateMixin<String> {
  final TextEditingController textEditingController = TextEditingController();

  List<Post> postList = <Post>[];

  final AppWriteClientController appWriteClientController =
      Get.find<AppWriteClientController>();
  createPost() async {
    try {
      if (textEditingController.text.isEmpty) {
        return;
      }
      Post post = Post.fromMap(<String, dynamic>{
        'author': jsonEncode(Get.find<AuthController>().profile!.toMap()),
        'body': textEditingController.text.trim(),
        'updatedAt': DateTime.now().toUtc().toString(),
        'createdAt': DateTime.now().toUtc().toString(),
      });

      Get.showOverlay(
        asyncFunction: () async {
          await appWriteClientController.database!.createDocument(
            collectionId: AppConstant.postCollectionId,
            documentId: AppConstant.docId,
            data: post.toMap(),
            read: ['role:member'],
            write: ['user:${Get.find<AuthController>().user!.$id}'],
            // write: ['role:member']
          ).then((value) => Get.back());
        },
        loadingWidget: Container(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  getPost() async {
    try {
      print("[+]getPost[+]");
      final DocumentList post =
          await appWriteClientController.database!.listDocuments(
        collectionId: AppConstant.postCollectionId,
        orderAttributes: ['createdAt'],
        orderTypes: ['DESC'],
      );

      Map<String, dynamic> data = post.toMap();
      List d = data['documents'].toList();
      postList = d.map((e) => Post.fromMap(e['data'])).toList();
      update();
      // print(d.first);
      // Post p = Post.fromMap(d.first['data']);
      // print(p);
    } catch (e) {
      throw Exception(e);
    }
  }
}
