import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/theme/custom_theme/app_bar_theme.dart';
import 'package:skill_in_a_box_flutter/core/theme/custom_theme/chip_theme.dart';
import 'package:skill_in_a_box_flutter/core/theme/custom_theme/dropdown_theme.dart';
import 'package:skill_in_a_box_flutter/core/theme/custom_theme/elevatedbutton_theme.dart';
import 'package:skill_in_a_box_flutter/core/theme/custom_theme/expansion_tile_theme.dart';
import 'package:skill_in_a_box_flutter/core/theme/custom_theme/list_tile_theme.dart';
import 'package:skill_in_a_box_flutter/core/theme/custom_theme/radio_button_theme.dart';
import 'package:skill_in_a_box_flutter/core/theme/custom_theme/tab_bar_theme.dart';
import 'package:skill_in_a_box_flutter/core/theme/custom_theme/text_button_theme.dart';
import 'package:skill_in_a_box_flutter/core/theme/custom_theme/text_selection_theme.dart';
import 'package:skill_in_a_box_flutter/core/theme/custom_theme/textformfield_theme.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      primaryColor: orange.shade500,
      useMaterial3: true,
      fontFamily: 'Raleway',
      brightness: Brightness.light,
      tabBarTheme: TabBarCustomTheme.tabBarLightTheme,
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: AppTextFromFieldTheme.lightDecoration,
      appBarTheme: CustomAppBarTheme.lightAppBarTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonTheme,
      textButtonTheme: CustomTextButtonTheme.textButtonTheme,
      expansionTileTheme: CustomExpansionTileTheme.expansionTileLightTheme,
      radioTheme: RadioButtonCustomTheme.radioLightThemeData,
      listTileTheme: CustomListTileTheme.listTileThemeData,
      chipTheme: CustomChipTheme.chipLightThemeData,
      textSelectionTheme: CustomTextSelectionTheme.textSelectionThemeData,
      dialogBackgroundColor: const Color(0xffffffff),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: orange),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: silverChalice.shade300, width: 0.8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          foregroundColor: silverChalice.shade800,
          backgroundColor: const Color(0xffffffff),
          textStyle: subtitle1,
        ),
      ),
      dropdownMenuTheme: AppDropDownTheme.lightTheme,);

  static ThemeData darkTheme = ThemeData(
      primaryColor: orange.shade500,
      useMaterial3: true,
      fontFamily: 'Raleway',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: AppTextFromFieldTheme.darkDecoration,
      appBarTheme: CustomAppBarTheme.darkAppBarTheme,
      tabBarTheme: TabBarCustomTheme.tabBarDarkTheme,
      expansionTileTheme: CustomExpansionTileTheme.expansionTileDarkTheme,
      chipTheme: CustomChipTheme.chipDarkThemeData,
      radioTheme: RadioButtonCustomTheme.radioDarkThemeData,
      elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonTheme,
      dialogBackgroundColor: const Color(0xff2C2C2E),
      textButtonTheme: CustomTextButtonTheme.textButtonTheme,
      listTileTheme: CustomListTileTheme.listTileThemeData,
      textSelectionTheme: CustomTextSelectionTheme.textSelectionThemeData,
      progressIndicatorTheme: ProgressIndicatorThemeData(color: orange),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: silverChalice.shade300, width: 0.8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          foregroundColor: silverChalice.shade800,
          backgroundColor: const Color(0xffffffff),
          textStyle: subtitle1,
        ),
      ),
      dropdownMenuTheme: AppDropDownTheme.lightTheme,);
}
