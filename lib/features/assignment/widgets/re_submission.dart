import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/add_submission_button.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/remarks.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/submission_details.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/submit_button_group.dart';

class ReSubmission extends StatelessWidget {
  const ReSubmission({
    required this.courseId,
    required this.sectionId,
    required this.lessonId,
    super.key,
  });
  final String lessonId;
  final String courseId;
  final String sectionId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        SubmissionDetails(lessonId: lessonId),
        const Remarks(),
        SizedBox(
          height: context.screenHeight * 0.04,
        ),
        Text(
          'Re - Submission',
          style: heading3.copyWith(color: silverChalice.shade700),
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        AddSubmissionButton(
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
