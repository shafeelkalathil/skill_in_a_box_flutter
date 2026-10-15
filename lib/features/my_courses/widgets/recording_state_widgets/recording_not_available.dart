import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class RecordingNotAvailableWidget extends StatelessWidget {
  const RecordingNotAvailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.screenHeight * 0.08,
      ),
      child: CustomDataNotFound(
        imageUrl: Assets.images.noCourses,
        title: 'Not Available',
        subTitle: 'Recordings not available',
      ),
    );
  }
}
