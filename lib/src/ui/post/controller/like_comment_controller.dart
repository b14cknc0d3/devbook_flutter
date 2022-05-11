import 'dart:convert';

import 'package:devbook/src/api/appwrite_client.dart';
import 'package:devbook/src/constant/constant.dart';
import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/model/profile.dart';
import 'package:get/get.dart';

class LikeCommentController extends GetxController {
  final AppWriteClientController appWriteClientController =
      Get.find<AppWriteClientController>();

  bool liked = false;
  final Profile profile = Get.find<AuthController>().profile!;
  doLike(
    String postId,
  ) async {
    try {
      appWriteClientController.database!.createDocument(
          collectionId: AppConstant.likeCollectionId,
          documentId: profile.user!.id,
          data: {
            'post_id': postId,
            'user_id': profile.user!.id,
            'user_profile': jsonEncode(profile.toMap()),
            'createdAt': DateTime.now().toUtc().toString(),
            'updatedAt': DateTime.now().toUtc().toString(),
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
