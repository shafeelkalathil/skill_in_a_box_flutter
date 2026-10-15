import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

class RecordingLoadingWidget extends StatelessWidget {
  const RecordingLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.screenPadding),
          CustomGridView(
            itemLength: 8,
            itemBuilder: (context, index) {
              return ShimmerCard(
                width: context.screenWidth * 0.3,
                height: context.screenHeight * 0.2,
                borderRadius: 16,
              );
            },
          ),
        ],
      ),
    );
  }
}
