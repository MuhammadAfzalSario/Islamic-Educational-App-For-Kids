import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/welcome_screen_controller.dart';
import '../widgets/button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeScreenController>(
      init: WelcomeScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/welcome.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.6,
                  fit: BoxFit.contain,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Aslam U Alaikum',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  'Welcome to the Islamic Kids App',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  buttonText: 'Start',
                  onPressedFunction: controller.goToNameScreen,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
