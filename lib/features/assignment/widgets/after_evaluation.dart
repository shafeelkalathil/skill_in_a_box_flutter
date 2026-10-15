import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_resubmission_view_model/resubmission_states.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_resubmission_view_model/resubmission_view_model.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/remarks.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/submission_details.dart';

class AfterEvaluation extends ConsumerWidget {
  const AfterEvaluation({
    required this.lessonId,
    required this.courseId,
    required this.sectionId,
    super.key,
  });
  final String lessonId;
  final String courseId;
  final String sectionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resubmissionState =
        ref.watch(assignmentResubmissionViewModelProvider(lessonId));
    return Column(
      children: [
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        SubmissionDetails(
          lessonId: lessonId,
        ),
        const Remarks(),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        if (resubmissionState is AssignmentResubmissionRequested)
          ElevatedButton(
            onPressed: null,
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(0xffE0E0E0)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Waiting for Approval',
                style: subtitle1.copyWith(color: silverChalice.shade900),
              ),
            ),
          )
        else if (resubmissionState is AssignmentResubmissionLoading)
          CircularProgressIndicator(
            color: orange,
          )
        else
          ElevatedButton(
            onPressed: () {
              ref
                  .read(
                    assignmentResubmissionViewModelProvider(lessonId).notifier,
                  )
                  .requestResubmission(
                    courseId: courseId,
                    lessonId: lessonId,
                    sectionId: sectionId,
                  );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('Request Resubmisson'),
            ),
          ),
        SizedBox(
          height: context.screenHeight * 0.1,
        ),
      ],
    );
  }
}
