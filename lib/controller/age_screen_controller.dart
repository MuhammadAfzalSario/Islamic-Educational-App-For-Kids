import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ui/DashBoard/dashboard.dart';

class AgeScreenController extends GetxController {
  RxInt age = 1.obs;
  Timer? timer;

  void incrementAge() async {
    if (age.value < 16 && timer == null) {
      age.value++;
      await saveAge();
      timer = Timer(const Duration(milliseconds: 200), () {
        timer = null;
      });
    }
  }

  void decrementAge() async {
    if (age.value > 1 && timer == null) {
      age.value--;
      await saveAge();
      timer = Timer(const Duration(milliseconds: 200), () {
        timer = null;
      });
    }
  }

  Future<void> saveAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('age', age.value);
  }

  void onPressed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    int? age = prefs.getInt('age');
    if (name != null && name.isNotEmpty && age != null) {
      Get.to(DashboardScreen());
    } else {
      Get.to(DashboardScreen());
    }
  }
}
