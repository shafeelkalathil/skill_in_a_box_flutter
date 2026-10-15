import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';

class CustomSnackBar {
  static SnackBar show({String? errorMessage}) {
    return SnackBar(
      content: Text(errorMessage ?? 'Something went wrong!'),
      backgroundColor: red.shade500,
    );
  }
}
