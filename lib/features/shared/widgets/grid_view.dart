import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    required this.itemLength,
    required this.itemBuilder,
    this.childAspectRatio,
    super.key,
  });

  final int itemLength;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double? childAspectRatio;

  @override
  Widget build(BuildContext context) {
    final defaultCustomAspectRatio = context.screenWidth > 600 ? 1.0 : 0.9;
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: itemLength,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.screenWidth >= 600 ? 3 : 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: childAspectRatio != null
            ? childAspectRatio!
            :defaultCustomAspectRatio,
      ),
      itemBuilder: itemBuilder,
      );
  }
}
