import 'package:get/get.dart';

class StoriesController extends GetxController {
  // This is a state variable
  var storyTitle = 'Story Title'.obs;
  var storyDescription = 'Story Description'.obs;
  var imagePath = 'assets/images/man.jpg'.obs;

  // Function to update the story title
  void updateTitle(String newTitle) {
    storyTitle.value = newTitle;
  }

  // Function to update the story description
  void updateDescription(String newDescription) {
    storyDescription.value = newDescription;
  }

  // Function to update the image path
  void updateImagePath(String newImagePath) {
    imagePath.value = newImagePath;
  }
}
