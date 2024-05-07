import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/name_screen_controller.dart';
import '../DashBoard/dashboard.dart';
import '../widgets/constants.dart';
import '../widgets/skip_button.dart';

class NameScreen extends StatelessWidget {
  final NameScreenController controller = Get.put(NameScreenController());

  NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThemeColor,
      body: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(0.08 * width),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: width,
                          minHeight: 0.5 * height,
                        ),
                        child: TextFormField(
                          controller: controller.nameController,
                          decoration: InputDecoration(
                            hintText: 'Name'.toUpperCase(),
                            hintStyle: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 0.09 * height,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                          validator: controller.validateName,
                          autofocus: true,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 0.09 * height,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.02 * height,
                    right: 0.02 * width,
                    child: SkipButton(
                      onPressed: () {
                        Get.to(DashboardScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.02 * height),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(0.02 * height),
                    child: Text(
                      "What's\nyour\nname?",
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 0.05 * height,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: controller.onPressed,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(0.025 * height),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 0.035 * height,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
