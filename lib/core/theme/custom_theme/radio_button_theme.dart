import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';

class RadioButtonCustomTheme {
  RadioButtonCustomTheme._();
  static RadioThemeData radioLightThemeData = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return orange;
      }
      return silverChalice.shade400;
    }),
  );

  static RadioThemeData radioDarkThemeData = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return orange;
      }
      return const Color(0xffD3D3D3);
    }),
  );
}
