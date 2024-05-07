import 'package:fyp_islamic_kids/ui/DashBoard/dashboard.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import '../ui/widgets/custom_button_sheet.dart';

class AllahUAkbarController extends GetxController {
  var _counter = 0.obs;
  late ConfettiController _confettiController;

  @override
  void onInit() {
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    super.onInit();
  }

  int get counter => _counter.value;

  void incrementCounter() {
    _counter++;
    if (_counter.value % 34 == 0) {
      _confettiController.play();
      Get.bottomSheet(
        CustomBottomSheet(
          confettiController: _confettiController,
          text: 'آپ نے 34 مرتبہ الله أكبر پڑھا ہے',
          onForwardPressed: () => Get.to(() => DashboardScreen()),
          onBackPressed: () => Get.back(),
        ),
      );
    }
  }
}
