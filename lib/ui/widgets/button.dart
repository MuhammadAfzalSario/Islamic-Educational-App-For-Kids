import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressedFunction;
  final double? buttonWidth;

  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onPressedFunction,
      this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double finalButtonWidth = buttonWidth ?? screenWidth * 0.25;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF00CA80),
        minimumSize: Size(finalButtonWidth, 50),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressedFunction,
      child: Text(
        buttonText,
        style: const TextStyle(
            letterSpacing: 2, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Rubik"),
      ),
    );
  }
}
