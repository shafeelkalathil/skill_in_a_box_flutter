import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: silverChalice.shade50,
      backgroundColor: orange.shade500,
      disabledForegroundColor: silverChalice.shade50,
      disabledBackgroundColor: silverChalice.shade300,
      side: const BorderSide(color: Colors.transparent),
      padding: const EdgeInsets.all(10),
      textStyle: subtitle1.copyWith(color: silverChalice.shade50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
