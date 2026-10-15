import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({
    required this.title,
    required this.actionText,
    required this.onTap,
    super.key,
  });
  final String title;
  final String actionText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: heading4.copyWith(
              fontSize: 14,
              color: dark ? Colors.white : silverChalice.shade900,
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            actionText,
            style: heading4.copyWith(
              fontSize: 14,
              color: orange.shade500,
            ),
          ),
        ),
      ],
    );
  }
}
