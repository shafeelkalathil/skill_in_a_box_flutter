import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({
    required this.widget,
    super.key,
    this.isPadding = true,
    this.isSymmetricPadding = false,
    this.color = const Color(0xffE7E7E7),
  });

  final Widget widget;
  final bool isPadding;
  final Color color;
  final bool isSymmetricPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color,
        ),
      ),
      padding: isSymmetricPadding
          ? EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06)
          : EdgeInsets.all(isPadding ? context.screenWidth * 0.06 : 0),
      child: widget,
    );
  }
}
