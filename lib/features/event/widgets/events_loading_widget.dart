import 'package:flutter/widgets.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

class EventsLoadingWidget extends StatelessWidget {
  const EventsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.screenWidth*0.06),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerCard(
              width: context.screenWidth,
              height: context.screenHeight * 0.07,
              borderRadius: 8,
            ),
            SizedBox(height: context.screenHeight * 0.04),
            ShimmerCard(
              width: context.screenWidth * 0.3,
              height: context.screenHeight * 0.02,
              borderRadius: 16,
            ),
            SizedBox(height: context.screenHeight * 0.01),
            CustomGridView(
              childAspectRatio: context.screenWidth >= 600
                  ? 0.4 + context.screenWidth * 0.001
                  : 0.1 + context.screenWidth * 0.0018,
              itemLength: 6,
              itemBuilder: (context, index) {
                return ShimmerCard(
                  width: context.screenWidth * 0.4,
                  height: context.screenWidth * 0.3,
                  borderRadius: 16,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
