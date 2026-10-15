import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class CustomListTileTheme {
  CustomListTileTheme._();

  static ListTileThemeData listTileThemeData = ListTileThemeData(
    horizontalTitleGap: 2,
    titleTextStyle: subtitle2.copyWith(color: silverChalice.shade800),
  );
}
