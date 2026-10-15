import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/submission_details.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/submit_button_group.dart';

class AfterUpload extends StatelessWidget {
  const AfterUpload({
    required this.lessonId,
    required this.sectionId,
    required this.courseId,
    super.key,
  });
  final String courseId;
  final String sectionId;
  final String lessonId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        SubmissionDetails(
          lessonId: lessonId,
        ),
        SubmitButtonGroup(
          lessonId: lessonId,
          courseId: courseId,
          sectionId: sectionId,
        ),
        SizedBox(
          height: context.screenHeight * 0.1,
        ),
      ],
    );
  }
}
