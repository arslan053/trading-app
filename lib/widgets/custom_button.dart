// lib/widgets/custom_button.dart
import 'package:flutter/material.dart';
import 'package:trading/constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        backgroundColor: ColorConstants.secondaryColor,
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text(text),
    );
  }
}
