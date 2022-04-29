import 'package:devbook/src/api/appwrite_client.dart';
import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => AppWriteClientController());
  }
}
