import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';

class CustomTextSelectionTheme {
  CustomTextSelectionTheme._();

  static TextSelectionThemeData textSelectionThemeData = TextSelectionThemeData(
    cursorColor: orange,
    selectionColor: orange.withOpacity(0.3),
    selectionHandleColor: orange,
  );
}
