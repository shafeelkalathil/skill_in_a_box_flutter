import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class CurriculumNotAvailableWidget extends StatelessWidget {
  const CurriculumNotAvailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.screenHeight * 0.08,
        left: context.screenPadding,
        right: context.screenPadding,
      ),
      child: CustomDataNotFound(
        imageUrl: Assets.images.noCertificate,
        title: 'Not Available',
        subTitle: 'Curriculum for this course is not available',
      ),
    );
  }
}
