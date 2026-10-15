import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class CustomTextButtonTheme {
  CustomTextButtonTheme._();
  static final textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStatePropertyAll(orange.shade50),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(5)),
      textStyle: WidgetStatePropertyAll(
        heading4,
      ),
      foregroundColor: WidgetStatePropertyAll(orange.shade500),
    ),
  );
}
