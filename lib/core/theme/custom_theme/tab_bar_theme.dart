import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class TabBarCustomTheme {
  TabBarCustomTheme._();
  static TabBarThemeData tabBarLightTheme = TabBarThemeData(
    indicatorSize: TabBarIndicatorSize.label,
    dividerHeight: 0,
    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
    labelColor: orange.shade500,
    unselectedLabelColor: silverChalice.shade500,
    labelStyle: heading4,
    unselectedLabelStyle: heading4,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: orange.shade500,
      ),
    ),
  );

  static TabBarThemeData tabBarDarkTheme = TabBarThemeData(
    indicatorSize: TabBarIndicatorSize.label,
    dividerHeight: 0,
    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
    labelColor: orange.shade500,
    unselectedLabelColor: const Color(0xffD3D3D3),
    labelStyle: heading4,
    unselectedLabelStyle: heading4,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: orange.shade500,
      ),
    ),
  );
}
