import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    required this.onPressed,
    this.errorMessage,
    this.padding,
    super.key,
  });
  final void Function() onPressed;
  final String? errorMessage;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding??EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: context.screenWidth * 0.7,
              child: Text(
                errorMessage ?? 'Something went wrong!',
                textAlign: TextAlign.center,
                style: subtitle1.copyWith(
                  color: silverChalice.shade900,
                ),
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
