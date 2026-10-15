import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

class OverviewLoadingWidget extends StatelessWidget {
  const OverviewLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: context.screenHeight * 0.02),
              child: ShimmerCard(
                width: context.screenWidth * 0.3,
                height: context.screenHeight * 0.02,
                borderRadius: 16,
              ),
            ),
            ShimmerCard(
              width: context.screenWidth,
              height: context.screenHeight * 0.2,
              borderRadius: 16,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: context.screenHeight * 0.02),
              child: ShimmerCard(
                width: context.screenWidth * 0.4,
                height: context.screenHeight * 0.02,
                borderRadius: 16,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: context.screenHeight * 0.02),
              child: ShimmerCard(
                width: context.screenWidth,
                height: context.screenHeight * 0.2,
                borderRadius: 16,
              ),
            ),
            ShimmerCard(
              width: context.screenWidth,
              height: context.screenHeight * 0.2,
              borderRadius: 16,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: context.screenHeight * 0.02),
              child: ShimmerCard(
                width: context.screenWidth * 0.5,
                height: context.screenHeight * 0.02,
                borderRadius: 16,
              ),
            ),
            ShimmerCard(
              width: context.screenWidth,
              height: context.screenHeight * 0.2,
              borderRadius: 16,
            ),
          ],
        ),
      ),
    );
  }
}
