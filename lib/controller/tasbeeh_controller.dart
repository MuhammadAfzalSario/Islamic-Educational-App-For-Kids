import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:confetti/confetti.dart';
import '../ui/Tasbeeh/alhmad_screen.dart';
import '../ui/widgets/custom_button_sheet.dart';

class TasbeehController extends GetxController {
  var _counter = 0.obs;
  late ConfettiController _confettiController;
  final player = AudioPlayer();

  @override
  void onInit() {
    _confettiController = ConfettiController(duration: Duration(seconds: 3));
    super.onInit();
  }

  int get counter => _counter.value;

  void incrementCounter() {
    _counter++;
    if (_counter.value % 33 == 0) {
      _confettiController.play();
      Get.bottomSheet(
        CustomBottomSheet(
          confettiController: _confettiController,
          text: 'مبارک ہو! آپ نے سبحان اللہ 33 مرتبہ پڑھا ہے۔',
          onForwardPressed: () => Get.to(() => AlhamdulilahScreen()),
          onBackPressed: () => Get.back(),
        ),
      );
    }
  }
}
