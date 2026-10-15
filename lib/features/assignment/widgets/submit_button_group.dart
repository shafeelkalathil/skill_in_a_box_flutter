import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_upload_view_model/assignment_upload_states.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_upload_view_model/assignment_upload_view_model.dart';

class SubmitButtonGroup extends ConsumerWidget {
  const SubmitButtonGroup({
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
    final uploadState = ref.watch(assignmentUploadViewModelProvider(lessonId));
    return Column(
      children: [
        SizedBox(
          height: context.screenHeight * 0.08,
        ),
        if (uploadState is AssignmentUploadLoading)
          ElevatedButton(onPressed: () {}, child: const Text('Submitting ...'))
        else
          SizedBox(
            width: context.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      print(uploadState);
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xffF9FBFD)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: context.screenHeight * 0.01,
                      ),
                      child: const Text('Close'),
                    ),
                  ),
                ),
                SizedBox(
                  width: context.screenWidth * 0.05,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (uploadState is AssignmentFilePicked) {
                        ref
                            .read(
                              assignmentUploadViewModelProvider(lessonId)
                                  .notifier,
                            )
                            .uploadFile(
                              ref,
                              lessonId: lessonId,
                              courseId: courseId,
                              sectionId: sectionId,
                            );
                      } else {
        
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a file to upload'),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: context.screenHeight * 0.002,
                      ),
                      child: const Text('Submit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
