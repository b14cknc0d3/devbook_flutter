import 'package:appwrite/models.dart';
import 'package:devbook/src/api/appwrite_client.dart';
import 'package:devbook/src/constant/constant.dart';
import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/model/profile.dart';
import 'package:devbook/src/routes/routes.dart';
import 'package:devbook/src/widgets/mysnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin<User> {
  final AppWriteClientController appWriteController =
      Get.put(AppWriteClientController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthController authController = Get.find();
  @override
  void onInit() {
    super.onInit();

    change(null, status: RxStatus.empty());
  }

  // verify() async {
  //   await account.updateVerification(
  //       userId: "62601935dc3341bcba7b",
  //       secret:
  //           "422f8e8bebde53fe12c94679b6755a47d35650d7d65494349991747fd11c9270c7c674177fd67824a957019991cb7492264f85202c82f4ba3530ccd427772888ebd36514a25675c81b7fad67e75fc9d68f7cd863929416a208e7279b97868237a23fa3ae7622dbd217703091325b71dc04d9494fe34e1749bcd51d6ed4f01add");
  // }

  doLogin() async {
    if (formKey.currentState!.validate()) {
      // change(null, status: RxStatus.loading());
      try {
        change(null, status: RxStatus.loading());
        //doLogin
        final response = await appWriteController.account!.createSession(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        User user = await appWriteController.account!.get();

        final data = await appWriteController.database!.getDocument(
            collectionId: AppConstant.profileCollectionId,
            documentId: user.$id);

        final data2 = data.toMap();
        final data3 = Map<String, dynamic>.from(data2['data']);
        final Profile profile = Profile.fromMap(data3);

        authController.saveUserdata(profile, user, response);

        Get.offAllNamed(
          MyRoutes.home,
        );
        // testCreateProfile(profile, response);

        change(user, status: RxStatus.success());
      } catch (e) {
        mySnackBar(e.toString(), true);
        change(null, status: RxStatus.error(e.toString()));
        throw Exception(e);
      }
    } else {
      mySnackBar("Please fill all the fields!", true);
      //snackbar
    }
  }
}
