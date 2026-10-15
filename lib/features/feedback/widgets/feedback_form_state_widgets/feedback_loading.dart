import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

class FeedbackLoadingWidget extends StatelessWidget {
  const FeedbackLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: index == 0
                ? context.screenHeight * 0.03
                : context.screenHeight * 0.02,
          ),
          child: ShimmerCard(
            width: context.screenWidth,
            height: context.screenHeight * 0.2,
            borderRadius: 16,
          ),
        );
      },
      itemCount: 5,
    );
  }
}
