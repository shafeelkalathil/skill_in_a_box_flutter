import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';

class CustomChipTheme {
  CustomChipTheme._();
  static ChipThemeData chipLightThemeData = ChipThemeData(
    selectedColor: orange.shade100,
    showCheckmark: false,
    padding: EdgeInsets.zero,
    backgroundColor: const Color(0xffffffff),
  );

  static ChipThemeData chipDarkThemeData = ChipThemeData(
    selectedColor: orange.shade100,
    showCheckmark: false,
    padding: EdgeInsets.zero,
    backgroundColor: const Color(0xff222223),
  );
}
