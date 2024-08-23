// lib/constants/color_constants.dart
import 'package:flutter/material.dart';

class ColorConstants {
  static const Color primaryColor = Color(0xFF4CAF50); // A nice green color
  static const Color secondaryColor = Color(0xFF1976D2); // A complementary blue color
  static const Color accentColor = Color(0xFFFFC107); // An accent yellow color
  static const Color backgroundColor = Color(0xFFF5F5F5); // A light background color
  static const Color textColor = Color(0xFF212121); // Dark text color

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
