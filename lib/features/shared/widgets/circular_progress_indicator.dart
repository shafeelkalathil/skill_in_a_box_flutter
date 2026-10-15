import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: context.screenWidth * 0.06,
      width: context.screenWidth * 0.06,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        color: orange,
      ),
    );
  }
}
