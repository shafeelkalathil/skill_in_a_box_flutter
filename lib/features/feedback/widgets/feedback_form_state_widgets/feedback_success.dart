import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/feedback/models/feedback_form/feedback_form_model.dart';
import 'package:skill_in_a_box_flutter/features/feedback/widgets/mcq_card.dart';
import 'package:skill_in_a_box_flutter/features/feedback/widgets/rating_card.dart';

class FeedbackSuccessWidget extends ConsumerWidget {
  const FeedbackSuccessWidget({required this.feedbackFormModel, super.key});
  final FeedbackFormModel feedbackFormModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              final content = feedbackFormModel.form!.content![index];
              return _buildContentByType(content);
            },
            itemCount: feedbackFormModel.form?.content?.length ?? 0,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Clear form',
                style: subtitle1.copyWith(
                  color: orange,
                  decoration: TextDecoration.underline,
                  decorationColor: orange,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContentByType(Content content) {
    switch (content.type) {
      case 'yes/no':
        return McqCard(
          content: content,
          isMultiSelect: content.allowMultipleAnswer ?? false,
        );
      case 'multipleChoice':
        return McqCard(
          content: content,
          isMultiSelect: content.allowMultipleAnswer ?? false,
        );
      case 'linearScale':
        return RatingCard(content: content);
      case 'shortAnswer':
        return SizedBox();
      default:
        return const Text('Unsupported question type');
    }
  }
}
