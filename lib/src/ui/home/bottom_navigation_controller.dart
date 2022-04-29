import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BnBController extends GetxController {
  int currentIndex = 0;
  final PageController pageController = PageController();

  changePage(int index) {
    currentIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    update();
  }
}
