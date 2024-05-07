import 'package:get/get.dart';
import '../ui/Name/name_screen.dart';
import 'package:just_audio/just_audio.dart';

class WelcomeScreenController extends GetxController {
  final player = AudioPlayer();

  @override
  void onInit() {
    super.onInit();
    playAudio();
  }

  void playAudio() async {
    await player.setAsset('assets/audio/salam.mp3');
    player.play();
  }

  void goToNameScreen() {
    Get.offAll(
          () => NameScreen(),
      transition: Transition.rightToLeftWithFade,
      duration: const Duration(milliseconds: 500),
    );
  }
}
