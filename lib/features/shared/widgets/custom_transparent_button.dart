import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class CustomTransparentButton extends StatelessWidget {
  const CustomTransparentButton({
    required this.text,
    this.width = 180,
    this.height = 44,
    this.selected = false,
    this.onTap,
    super.key,});
  final double width;
  final double height;
  final bool selected;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected  ? orange.shade500
                : dark ? Colors.transparent: silverChalice.shade100,
          ),
          color: selected
              ? (dark ? const Color(0xff222223) : Colors.orange.shade200)
              : (dark ? const Color(0xff222223) : null),
        ),
        child: Center(
          child: Text(text,style: subtitle2.copyWith(
            color: selected
                ? orange.shade500
                : dark ? Colors.white
                : silverChalice.shade900,),),
        ),
      ),
    );
  }
}
