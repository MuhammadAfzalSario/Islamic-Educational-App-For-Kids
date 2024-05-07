import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatelessWidget {
  final ConfettiController confettiController;
  final String text;
  final VoidCallback? onForwardPressed;
  final VoidCallback onBackPressed;
  final String assetImagePath;

  CustomBottomSheet({
    required this.confettiController,
    required this.text,
    this.onForwardPressed,
    required this.onBackPressed,
    this.assetImagePath = 'assets/images/celebration.png',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: Get.height * 0.33,
          child: Image.asset(
            assetImagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: Get.height * 0.33,
          child: ConfettiWidget(
            confettiController: confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ],
          ),
        ),
        Container(
          height: Get.height * 0.4,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style:
                      const TextStyle(fontSize: 24, fontFamily: 'Jameel-Noori'),
                  textAlign: TextAlign.center,
                  locale: const Locale('ur', 'PK'),
                ),
                if (onForwardPressed != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(130, 40),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    onPressed: onForwardPressed,
                    child: const Text(
                      'آگے جاؤ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Jameel-Noori',
                      ),
                    ),
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(130, 40),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  onPressed: onBackPressed,
                  child: const Text(
                    'جاری رکھیں',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'Jameel-Noori',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
