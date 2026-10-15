import 'package:skill_in_a_box_flutter/features/feedback/models/feedback_form/feedback_form_model.dart';

abstract class FeedbackFormState {
  FeedbackFormState();
}

class FeedbackFormInitial implements FeedbackFormState {}

class FeedbackFormLoading implements FeedbackFormState {}

class FeedbackFormSuccess implements FeedbackFormState {
  FeedbackFormSuccess({
    required this.feedbackFormModel,
  });
  final FeedbackFormModel? feedbackFormModel;
}

class FeedbackFormFailure implements FeedbackFormState {
  FeedbackFormFailure({required this.errorMessage});
  final String errorMessage;
}
