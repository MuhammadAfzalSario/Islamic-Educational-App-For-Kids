import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  SkipButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return TextButton(
      child: Text(
        'Skip',
        style: TextStyle(color: Colors.white, fontSize: 0.03 * height),
      ),
      onPressed: onPressed,
    );
  }
}