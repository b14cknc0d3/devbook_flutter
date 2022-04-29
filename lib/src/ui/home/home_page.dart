import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/ui/chat/chat_page.dart';
import 'package:devbook/src/ui/home/bottom_navigation_controller.dart';
import 'package:devbook/src/ui/home/widgets/devbook_text.dart';
import 'package:devbook/src/ui/post/post_page.dart';
import 'package:devbook/src/ui/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const DevBookText(),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                Get.find<AuthController>().clearUserdata();
              },
            ),
          ],
        ),
        body: GetBuilder<BnBController>(
          init: BnBController(),
          builder: (controller) => PageView(
            controller: controller.pageController,
            children: [
              const PostPage(),
              const ChatPage(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: GetBuilder<BnBController>(
          init: BnBController(),
          builder: (controller) {
            return BottomNavigationBar(
              currentIndex: controller.currentIndex,
              onTap: (value) => controller.changePage(value),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            );
          },
        ));
  }
}
