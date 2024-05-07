import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.asset('assets/videos/manner.mp4')
      ..initialize().then((_) {
        update();
      });
  }

  void togglePlay() {
    videoPlayerController.value.isPlaying
        ? videoPlayerController.pause()
        : videoPlayerController.play();
    update();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
  }
}