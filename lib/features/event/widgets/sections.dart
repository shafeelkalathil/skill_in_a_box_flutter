import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';





class SectionTitle extends StatelessWidget {
  const SectionTitle({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Text(text, style: heading3.copyWith(color: dark
        ? Colors.white:silverChalice.shade900,),);
  }
}

class SectionRow extends StatelessWidget {
  const SectionRow({required this.iconPath, required this.text, super.key});
  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(width: 15),
        Text(
          text,
          style: heading3.copyWith(color: silverChalice.shade900, fontSize: 14),
        ),
      ],
    );
  }
}
