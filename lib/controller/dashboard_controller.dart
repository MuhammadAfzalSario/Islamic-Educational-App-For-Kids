import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui/HomePage/home_page.dart';
import '../ui/VideoPage/video_page.dart';

class DashboardController extends GetxController {
  var pageIndex = 0.obs;
  final List<Widget> pageOptions = [
    const HomePage(),
     VideoPage(),
  ];
  final List<String> appBarTitles = [
    'Home',
    'Videos',
  ];
}
