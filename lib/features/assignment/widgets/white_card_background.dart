import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';

class WhiteCardBackground extends StatelessWidget {
  const WhiteCardBackground({
    required this.child,
    this.verticalPadding,
    super.key,
  });
  final Widget child;
  final double? verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.04,
        vertical: verticalPadding ?? context.screenWidth * 0.06,
      ),
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: silverChalice.shade100),
      ),
      child: child,
    );
  }
}
