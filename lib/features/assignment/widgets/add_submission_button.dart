
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_upload_view_model/assignment_upload_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';


class AddSubmissionButton extends StatelessWidget {
  const AddSubmissionButton({required this.lessonId ,super.key});
  final String lessonId;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return RoundedContainer(
          widget: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
            child: ElevatedButton(
              onPressed: () {
                ref
                    .read(assignmentUploadViewModelProvider(lessonId).notifier)
                    .fetchFile();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: silverChalice.shade50,
                  ),
                  SizedBox(
                    width: context.screenWidth * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: context.screenHeight * 0.005,
                    ),
                    child: Text(
                      'Add Submission',
                      style: heading3.copyWith(color: silverChalice.shade50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
