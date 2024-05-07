import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../controller/videopage_controller.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
      init: VideoController(),
      builder: (controller) {
        double width = MediaQuery.of(context).size.width;

        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: controller.videoPlayerController.value.isInitialized
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: GestureDetector(
                      onTap: controller.togglePlay,
                      child: AspectRatio(
                        aspectRatio:
                            controller.videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(controller.videoPlayerController),
                      ),
                    ),
                  )
                : const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
