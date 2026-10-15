import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

class MyCourseLoadingWidget extends StatelessWidget {
  const MyCourseLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
        child: Column(
          children: [
            SizedBox(height: context.screenHeight * 0.03),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ShimmerCard(
                  width: context.screenWidth,
                  height: context.screenHeight * 0.18,
                  borderRadius: 16,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: context.screenWidth * 0.04);
              },
              itemCount: 6,
            ),
          ],
        ),
      ),
    );
  }
}
