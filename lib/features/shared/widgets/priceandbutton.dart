import 'package:flutter/material.dart';

import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class BuildPriceAndButton extends StatelessWidget {
  const BuildPriceAndButton({
    required this.price,
    required this.buttonText,
    required this.buttonWidth,
    required this.onTap,
    super.key,});
  final String price;
  final String buttonText;
  final double buttonWidth;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            price,
            style: heading1.copyWith(
              fontWeight: FontWeight.w600,
              color: orange.shade500,
            ),
          ),
        ),
        SizedBox(
          width: buttonWidth,
          child: ElevatedButton(onPressed: onTap, child: Text(buttonText)),
        ),
      ],
    );
  }
}
