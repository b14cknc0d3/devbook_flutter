import 'package:devbook/src/ui/signup/signup_controller.dart';
import 'package:get/get.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
