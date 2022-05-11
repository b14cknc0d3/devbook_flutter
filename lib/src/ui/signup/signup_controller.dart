import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:devbook/src/api/appwrite_client.dart';
import 'package:devbook/src/constant/constant.dart';
import 'package:devbook/src/utils/extensions.dart';
import 'package:devbook/src/widgets/mysnackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with StateMixin<User> {
  final AppWriteClientController appWriteClientController =
      Get.put(AppWriteClientController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  Future<void> doSignUp() async {
    if (formKey.currentState!.validate()) {
      if (passwordController.text.trim() !=
          confirmPasswordController.text.trim()) {
        //snackbar
        mySnackBar("Password doesn't match", true);
      } else {
        change(null, status: RxStatus.loading());
        try {
          //doSignup
          final User user = await appWriteClientController.account!.create(
            userId: 'unique()',
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            name: userNameController.text.trim(),
          );
          await appWriteClientController.account!.createSession(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
          // will not work now
          await appWriteClientController.account!
              .createVerification(url: 'http://172.104.188.52:9000/');

          await appWriteClientController.database!.createDocument(
              collectionId: AppConstant.profileCollectionId,
              documentId: user.$id,
              data: {
                "id": user.$id,
                "user_map": jsonEncode(user.toSafeMap()),
                "phone": "",
                "address": "",
                "city": "",
                "state": "",
                "country": "",
                "zipCode": "",
                "bio": "",
                "hobby": "",
                "skill": "",
                "createdAt": DateTime.now().toIso8601String(),
                "updatedAt": DateTime.now().toIso8601String(),
                "profile_pic_url":
                    "https://www.gravatar.com/avatar/${user.email.generateMd5()}?s=32&d=robohash&r=g",
                "verified": user.emailVerification,
              },
              read: [
                'role:member'
              ]);

          change(user, status: RxStatus.success());
        } on AppwriteException catch (e) {
          change(null, status: RxStatus.error(e.toString()));
          throw Exception(e);
        }
      }
    } else {
      mySnackBar("Please fill all the fields!", true);
      //snackbar
    }
  }
}

extension on User {
  Map<String, dynamic> toSafeMap() {
    return {
      "\$id": $id,
      "name": name,
      "email": email,
    };
  }
}
