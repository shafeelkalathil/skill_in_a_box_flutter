import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    required this.title,
    required this.buttonTitle,
    required this.onTap,
    super.key,
  });

  final String title;
  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: heading4.copyWith(fontSize: 14, color: dark
              ? Colors.white
              :silverChalice.shade900,),
          children: [
            TextSpan(text: title),
            WidgetSpan(
              child: GestureDetector(
                onTap: onTap,
                child: Text(
                  buttonTitle,
                  style: heading4.copyWith(
                    color: orange.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
