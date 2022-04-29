import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  final AuthController authController = Get.put(AuthController());

  @override
  RouteSettings? redirect(String? route) {
    return authController.profile != null
        ? null
        : const RouteSettings(name: MyRoutes.signUp);
  }
}
