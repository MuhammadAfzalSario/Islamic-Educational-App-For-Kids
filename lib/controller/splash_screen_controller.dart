import 'package:flutter/material.dart';
import 'package:fyp_islamic_kids/ui/DashBoard/dashboard.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ui/Welcome/welcome.dart';

class SplashScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  Animation<double> get animation => _animation;

  @override
  void onInit() {
    super.onInit();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward().then((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userName = prefs.getString('userName');
      // String? userAge = prefs.getString('userAge');

      if (userName != null) {
        // && userAge != null
        Get.offAll(() => DashboardScreen());
      } else {
        Get.offAll(() => WelcomeScreen());
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
