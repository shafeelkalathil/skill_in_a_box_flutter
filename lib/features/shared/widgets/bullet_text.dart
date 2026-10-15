import 'package:flutter/material.dart';

import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class CustomIconWithText extends StatelessWidget {
  const CustomIconWithText({
    required this.subTitleContent,
    this.subTitleHeading = '',
    super.key,
    this.isShowIcon = false,
    this.iconWidget = const SizedBox(),
  });

  final bool isShowIcon;
  final Widget iconWidget;
  final String subTitleHeading;
  final String subTitleContent;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(isShowIcon)Padding(
          padding: const EdgeInsets.only(top: 8),
          child: iconWidget,
        ),
        if(isShowIcon)const SizedBox(width: 15),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: AppHelpers.removeHtmlTags(subTitleHeading) ,
              style: subtitle2.copyWith(color: dark
                  ? const Color(0xffD3D3D3) : silverChalice.shade700,),
              children: [
                TextSpan(
                  text:AppHelpers.removeHtmlTags(subTitleContent),
                  style: subtitle2.copyWith(color: dark
                      ? const Color(0xffD3D3D3) :silverChalice.shade500,),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
