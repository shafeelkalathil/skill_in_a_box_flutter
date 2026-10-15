import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.screenWidth*0.04),
      child: Column(
        children: [
          ShimmerCard(
            width: context.screenWidth,
            height: context.screenHeight * 0.02,
            borderRadius: 24,
          ),
          SizedBox(height: context.screenHeight * 0.02),
          ShimmerCard(
            width: context.screenWidth,
            height: context.screenHeight * 0.3,
            borderRadius: 24,
          ),
          SizedBox(height: context.screenHeight*0.04),
          ShimmerCard(
            width: context.screenWidth,
            height: context.screenHeight * 0.02,
            borderRadius: 24,
          ),
          SizedBox(height: context.screenHeight * 0.02),
          ShimmerCard(
            width: context.screenWidth,
            height: context.screenHeight * 0.3,
            borderRadius: 24,
          ),
        ],
      ),
    );
  }
}
