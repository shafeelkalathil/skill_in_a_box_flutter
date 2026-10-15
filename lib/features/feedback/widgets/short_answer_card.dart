import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/feedback/models/feedback_form/feedback_form_model.dart';
import 'package:skill_in_a_box_flutter/features/feedback/models/feedback_response/feedback_response_model.dart';
import 'package:skill_in_a_box_flutter/features/feedback/view_models/feedback_response/feedback_response_view_model.dart';
import 'package:skill_in_a_box_flutter/features/feedback/views/feedback_view.dart';

class ShortAnswerCard extends ConsumerWidget {
  const ShortAnswerCard({required this.content, super.key});
  final Content content;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = AppHelpers.isDarkMode(context);
    final isSubmitButtonPressed = ref.watch(isSubmitButtonClickedProvider);
    return Container(
      width: context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: dark ? Colors.transparent : silverChalice.shade100,
        ),
        color: dark ? const Color(0xff2C2C2E) : const Color(0xffffffff),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              content.question ?? 'question',
              style: subtitle3.copyWith(
                color: dark ? Colors.white : silverChalice.shade900,
              ),
            ),
          ),
          TextFormField(
            maxLines: null,
            textInputAction: TextInputAction.done,
            decoration:
                const InputDecoration(hintText: 'Type your answer here...'),
            onFieldSubmitted: (value) {
              final submission = Submission(
                questionId: content.id,
                submittedAnswer: [value],
              );
              ref
                  .read(feedbackResponseViewmodelProvider.notifier)
                  .updateSubmissionList(submission);
            },
          ),
          if (content.isMandatory! &&
              isSubmitButtonPressed &&
              ref
                  .read(feedbackResponseViewmodelProvider.notifier)
                  .isAnswerEmpty(content.id!))
            Padding(
              padding: EdgeInsets.only(top: context.screenHeight * 0.02),
              child: Text(
                'Please enter your answer',
                style: subtitle2.copyWith(color: red),
              ),
            ),
        ],
      ),
    );
  }
}
