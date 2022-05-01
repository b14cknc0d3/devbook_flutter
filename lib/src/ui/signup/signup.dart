import 'package:devbook/src/constant/color.dart';
import 'package:devbook/src/ui/home/widgets/devbook_text.dart';
import 'package:devbook/src/ui/login/binding.dart';
import 'package:devbook/src/ui/login/login_page.dart';
import 'package:devbook/src/ui/signup/signup_controller.dart';
import 'package:devbook/src/widgets/signin_up_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetWidget<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // ignore: sized_box_for_whitespace
        child: Container(
          height: Get.height + 200,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const DevBookText(),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  // height: Get.height * 0.75,
                  decoration: const BoxDecoration(
                    color: ColorPlatte.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                // fontFamily: 'CircularStd-Bold',
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFormField(
                            controller: controller.userNameController,
                            labelText: "User name",
                            hintText: "Enter your username"),
                        const SizedBox(
                          height: 8,
                        ),
                        MyTextFormField(
                            controller: controller.emailController,
                            labelText: "Email",
                            hintText: "Enter your email"),
                        const SizedBox(
                          height: 8,
                        ),
                        MyTextFormField(
                            controller: controller.passwordController,
                            labelText: "Password",
                            hintText: "Enter your password"),
                        const SizedBox(
                          height: 8,
                        ),
                        MyTextFormField(
                            controller: controller.confirmPasswordController,
                            labelText: "Confirm Password",
                            hintText: "Enter your password again"),
                        const SizedBox(
                          height: 32,
                        ),
                        controller.obx(
                          (state) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      primary: ColorPlatte.buttonColor,
                                      shape: const StadiumBorder(),
                                      fixedSize: Size(Get.height, 58)),
                                  onPressed: () {
                                    Get.to(() => const LoginPage(),
                                        duration:
                                            const Duration(milliseconds: 500),
                                        transition: Transition.cupertino,
                                        curve: Curves.easeIn,
                                        binding: LoginBinding());
                                  },
                                  child: const Text(
                                    'Success',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'CircularStd-Medium',
                                        fontWeight: FontWeight.w500),
                                  )),
                            );
                            // return ElevatedButton(
                            //     onPressed: () {}, child: const Text("Success"));
                          },
                          onLoading: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: ColorPlatte.buttonColor,
                                    shape: const StadiumBorder(),
                                    fixedSize: Size(Get.height, 58)),
                                onPressed: () {},
                                child: const CircularProgressIndicator()),
                          ),
                          onEmpty: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: ColorPlatte.buttonColor,
                                    shape: const StadiumBorder(),
                                    fixedSize: Size(Get.height, 58)),
                                onPressed: () {
                                  controller.confirmPasswordController.text
                                          .isNotEmpty
                                      ? controller.doSignUp()
                                      : null;
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'CircularStd-Medium',
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                          onError: (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: ColorPlatte.buttonColor,
                                    shape: const StadiumBorder(),
                                    fixedSize: Size(Get.height, 58)),
                                onPressed: () {
                                  controller.confirmPasswordController.text
                                          .isNotEmpty
                                      ? controller.doSignUp()
                                      : null;
                                },
                                child: const Text(
                                  'Sign Up Again!',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      // fontFamily: 'CircularStd-Medium',
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontFamily: 'CircularStd-Book',
                                fontSize: 14,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => const LoginPage(),
                                      duration:
                                          const Duration(milliseconds: 500),
                                      transition: Transition.cupertino,
                                      curve: Curves.easeIn,
                                      binding: LoginBinding());
                                },
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(
                                    fontFamily: 'CircularStd-Bold',
                                    fontSize: 14,
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
