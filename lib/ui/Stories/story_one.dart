import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/first_story_contoller.dart';
import '../widgets/image_navigation_button.dart';

class FirstStory extends StatelessWidget {
  final FirstStoryController controller = Get.put(FirstStoryController());

  FirstStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
        color: Colors.green,
      ),
      ),
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.images.length,
            itemBuilder: (context, index) {
              return Center(
                child: Image.asset(controller.images[index]),
              );
            },
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: ImageNavigationButton(
              icon: Icons.arrow_back,
              onPressed: controller.previousPage,
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: ImageNavigationButton(
              icon: Icons.arrow_forward,
              onPressed: controller.nextPage,
            ),
          ),
        ],
      ),
    );
  }
}
