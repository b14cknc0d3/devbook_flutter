import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/ui/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class RootPage extends GetWidget<AuthController> {
//   const RootPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Future.delayed(
//         const Duration(milliseconds: 300),
//       ),
//       builder: (ctx, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (controller.profile == null) {
//             return SignUpPage();
//           }
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
