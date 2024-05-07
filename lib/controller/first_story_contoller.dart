import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FirstStoryController extends GetxController {
  RxList<String> images = [
    'assets/images/image1.png',
    'assets/images/image2.jfif',
  ].obs;
  PageController pageController = PageController(initialPage: 0);

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
