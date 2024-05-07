import 'package:flutter/material.dart';

class ImageNavigationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  ImageNavigationButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}