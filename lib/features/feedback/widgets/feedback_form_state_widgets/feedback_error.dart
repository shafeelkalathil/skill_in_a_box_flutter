import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/feedback/view_models/feedback_form/feedback_form_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';

class FeedbackErrorWidget extends ConsumerWidget {
  const FeedbackErrorWidget({
    required this.id,
    required this.usage,
    required this.errorMessage,
    super.key,
  });
  final String id;
  final String usage;
  final String errorMessage;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomErrorWidget(
      errorMessage: errorMessage,
      onPressed: () {
        ref
            .read(feedbackFormViewModelProvider.notifier)
            .getFeedbackForm(usage: usage, id: id);
      },
    );
  }
}
