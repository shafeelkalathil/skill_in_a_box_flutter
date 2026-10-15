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

class RatingCard extends ConsumerStatefulWidget {
  const RatingCard({
    required this.content,
    super.key,
  });
  final Content content;

  @override
  ConsumerState<RatingCard> createState() => _RatingCardState();
}

class _RatingCardState extends ConsumerState<RatingCard> {
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
     final isSubmitButtonPressed = ref.watch(isSubmitButtonClickedProvider);
    final dark = AppHelpers.isDarkMode(context);
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
              widget.content.question ?? 'question',
              style: subtitle3.copyWith(
                color: dark ? Colors.white : silverChalice.shade900,
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final availableWidth = constraints.maxWidth;
              const spacing = 8;
              final chipWidth = (availableWidth -
                      (spacing * (widget.content.scaleCount! - 1))) /
                  widget.content.scaleCount!;

              return SizedBox(
                width: context.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(widget.content.scaleCount!, (index) {
                    final rating = index + 1;
                    return SizedBox(
                      width: chipWidth,
                      child: ChoiceChip(
                        label: Container(
                          alignment: Alignment.center,
                          child: Text(
                            rating.toString(),
                            style: subtitle2.copyWith(
                              color: selectedRating == rating
                                  ? orange.shade500
                                  : dark
                                      ? const Color(0xffD3D3D3)
                                      : silverChalice.shade400,
                            ),
                          ),
                        ),
                        side: BorderSide(
                          color: selectedRating == rating
                              ? orange.shade500
                              : dark
                                  ? Colors.transparent
                                  : silverChalice.shade200,
                        ),
                        selected: selectedRating == rating,
                        onSelected: (value) {
                          setState(() {
                            selectedRating = rating;
                          });
                          final submission = Submission(
                            questionId: widget.content.id,
                            submittedAnswer: [rating.toString()],
                          );
                          ref
                              .read(feedbackResponseViewmodelProvider.notifier)
                              .updateSubmissionList(submission);
                        },
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: chipWidth * 0.1,
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
          if (widget.content.isMandatory! &&
              isSubmitButtonPressed &&
              ref
                  .read(feedbackResponseViewmodelProvider.notifier)
                  .isAnswerEmpty(widget.content.id!))
            Padding(
              padding: EdgeInsets.only(top: context.screenHeight * 0.02),
              child: Text(
                'Please select an option',
                style: subtitle2.copyWith(color: red),
              ),
            ),
        ],
      ),
    );
  }
}
