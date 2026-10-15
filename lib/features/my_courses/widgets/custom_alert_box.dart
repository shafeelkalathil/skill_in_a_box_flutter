import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class CustomAlertBox extends StatelessWidget {
  const CustomAlertBox(
      {this.title,
      this.subtitle,
      this.actions,
      this.actionsAlignment,
      super.key,});
  final String? title;
  final String? subtitle;
  final List<Widget>? actions;
  final MainAxisAlignment? actionsAlignment;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.info_outline,
            color: orange,
          ),
          GestureDetector(
            child: Icon(
              Icons.close,
              color: dark ? Colors.white : silverChalice.shade800,
              size: 16,
            ),
            onTap: () {
              context.router.popForced();
            },
          ),
        ],
      ),
      content: SizedBox(
        width: context.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? 'Title',
              style: heading3.copyWith(
                color: dark ? Colors.white :silverChalice.shade900,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            if (subtitle == null)
              const SizedBox.shrink()
            else
              Text(
                subtitle!,
                style: heading4.copyWith(
                  color: dark
                      ? const Color(0xffD3D3D3) : silverChalice.shade500,
                ),
              ),
          ],
        ),
      ),
      actions: actions,
      actionsAlignment: actionsAlignment ?? MainAxisAlignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
