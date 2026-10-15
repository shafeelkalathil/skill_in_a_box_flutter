import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';

class CustomExpansionTileTheme {
  CustomExpansionTileTheme._();

  static final expansionTileLightTheme = ExpansionTileThemeData(
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: silverChalice.shade100),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: silverChalice.shade100),
    ),
    backgroundColor: const Color(0xfffafafa),
    iconColor: silverChalice.shade700,
    textColor: silverChalice.shade700,
    collapsedIconColor: silverChalice.shade700,
    collapsedTextColor: silverChalice.shade700,
  );

  static final expansionTileDarkTheme = ExpansionTileThemeData(
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(),
    ),
    backgroundColor: const Color(0xff2C2C2E),
    iconColor: const Color(0xffD3D3D3),
    textColor: const Color(0xffD3D3D3),
    collapsedIconColor: const Color(0xffD3D3D3),
    collapsedTextColor: const Color(0xffD3D3D3),
  );
}
