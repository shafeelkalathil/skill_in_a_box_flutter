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

class McqCard extends ConsumerStatefulWidget {
  const McqCard({
    required this.content,
    required this.isMultiSelect,
    super.key,
  });

  final Content content;
  final bool isMultiSelect;

  @override
  ConsumerState<McqCard> createState() => _McqCardState();
}

class _McqCardState extends ConsumerState<McqCard> {
  String selectedValue = '';
  Map<String, bool> selectedValues = {};

  @override
  void initState() {
    super.initState();
    if (widget.isMultiSelect && widget.content.options != null) {
      for (final option in widget.content.options!) {
        selectedValues[option] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              widget.content.question ?? 'question',
              style: subtitle3.copyWith(
                color: dark ? Colors.white : silverChalice.shade900,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final option = widget.content.options?[index] ?? 'value';

              return widget.isMultiSelect

                  //for multi selection
                  ? CheckboxListTile(
                      activeColor: orange,
                      controlAffinity: ListTileControlAffinity.leading,
                      side:
                          BorderSide(color: silverChalice.shade500, width: 1.5),
                      value: selectedValues[option] ?? false,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      onChanged: (value) async {
                        setState(() {
                          selectedValues[option] = value ?? false;
                        });
                        final submission = Submission(
                          questionId: widget.content.id,
                          submittedAnswer: getSelectedOptions(),
                        );
                        ref
                            .read(feedbackResponseViewmodelProvider.notifier)
                            .updateSubmissionList(submission);
                        // print('Selected values: ${getSelectedOptions()}');
                      },
                      title: Text(
                        option,
                        style: subtitle2.copyWith(
                          color: dark
                              ? const Color(0xffD3D3D3)
                              : silverChalice.shade800,
                        ),
                      ),
                      dense: true,
                    )
                    
                  //for single selection
                  : RadioListTile(
                      value: option,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      groupValue: selectedValue,
                      onChanged: (value) async {
                        final submission = Submission(
                          questionId: widget.content.id,
                          submittedAnswer: [value!],
                        );
                        ref
                            .read(feedbackResponseViewmodelProvider.notifier)
                            .updateSubmissionList(submission);
                        setState(() {
                          selectedValue = value;
                        });
                        // print('Selected value: $value');
                      },
                      title: Text(
                        option,
                        style: subtitle2.copyWith(
                          color: dark
                              ? const Color(0xffD3D3D3)
                              : silverChalice.shade800,
                        ),
                      ),
                      dense: true,
                    );
            },
            itemCount: widget.content.options?.length ?? 0,
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

  List<String> getSelectedOptions() {
    return selectedValues.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }
}
