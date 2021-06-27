import 'package:flutter/material.dart';

class BrightnessTest {
  final bool isDark;
  final Brightness brightness;
  final Color color;

  BrightnessTest(this.isDark)
      : brightness = isDark ? Brightness.dark : Brightness.light,
        color = isDark ? Colors.black : Colors.white;

  static List<BrightnessTest> get testCases {
    return [BrightnessTest(true), BrightnessTest(false)];
  }
}
