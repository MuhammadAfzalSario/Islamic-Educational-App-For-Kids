import 'package:flutter/material.dart';
import 'package:fyp_islamic_kids/ui/Stories/story_one.dart';
import 'package:get/get.dart';
import '../../controller/stories_controller.dart';
import '../widgets/search.dart';
import '../widgets/story_card.dart';

class StoriesScreen extends StatelessWidget {
  final StoriesController controller = Get.put(StoriesController());

  StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Obx(() => Text(
          controller.storyTitle.value,
          style: const TextStyle(
              color: Colors.green,
              fontSize: 20,
            fontFamily: 'Rubik'
            ),
        )),
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
      ),
      body: Column(
        children: [
          Obx(() => StoryCard(
            title: controller.storyTitle.value,
            description: controller.storyDescription.value,
            imagePath: controller.imagePath.value,
            destinationScreen: FirstStory(),
          )),
        ],
      ),
    );
  }
}
