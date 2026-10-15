import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    required this.width,
    required this.height,
    required this.borderRadius,
    super.key,
    this.baseColor,
    this.highlightColor,
  });
  final double width;
  final double height;
  final double borderRadius;
  final Color? baseColor;
  final Color? highlightColor;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: baseColor ?? (dark ?silverChalice.shade800 :silverChalice.shade50),
      highlightColor: highlightColor ?? (dark ? silverChalice.shade900 :  silverChalice.shade100),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: silverChalice.shade200,
        ),
      ),
    );
  }
}
