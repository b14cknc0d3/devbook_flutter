import 'package:devbook/src/api/appwrite_client.dart';
import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/model/profile.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  AppWriteClientController appWriteClientController = Get.find();
  AuthController authController = Get.find();
  getOrCreateProfile(Profile profile) async {
    try {} catch (e) {
      throw Exception(e);
    }
  }
}
