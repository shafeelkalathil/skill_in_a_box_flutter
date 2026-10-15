import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerCard(
        width: context.screenWidth,
        height: context.screenHeight*0.1,
        borderRadius: 16,),
        SizedBox(height:context.screenHeight*0.03),
        ShimmerCard(
        width: context.screenWidth,
        height: context.screenHeight*0.4,
        borderRadius: 16,),
         SizedBox(height:context.screenHeight*0.06),
         ShimmerCard(
        width: context.screenWidth,
        height: context.screenHeight*0.2,
        borderRadius: 16,),
         SizedBox(height:context.screenHeight*0.06),
         ShimmerCard(
        width: context.screenWidth,
        height: context.screenHeight*0.05,
        borderRadius: 16,),
      ],
    );
  }
}