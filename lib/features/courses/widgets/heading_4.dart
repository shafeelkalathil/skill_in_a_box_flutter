import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class Heading4 extends StatelessWidget {
  const Heading4({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child:
          Text(text, style: heading3.copyWith(color: dark
              ? Colors.white : silverChalice.shade800,),),
    );
  }
}
