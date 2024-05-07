import 'package:flutter/material.dart';
import 'package:fyp_islamic_kids/ui/DashBoard/dashboard.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters';
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Invalid name';
    }
    return null;
  }

  void onPressed() async {
    if (formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', nameController.text);
      Get.offAll(
        () => DashboardScreen(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 500),
      );
    }
  }
}
