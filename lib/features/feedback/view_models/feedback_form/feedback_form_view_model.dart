import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/feedback/repositories/feedback_repository.dart';
import 'package:skill_in_a_box_flutter/features/feedback/view_models/feedback_form/feedback_form_states.dart';

final feedbackFormViewModelProvider =
    StateNotifierProvider<FeedbackFormViewModel, FeedbackFormState>(
  (ref) => FeedbackFormViewModel(ref.watch(feedbackRepositoryProvider)),
);

class FeedbackFormViewModel extends StateNotifier<FeedbackFormState> {
  FeedbackFormViewModel(this.feedbackRepository) : super(FeedbackFormInitial());

  final FeedbackRepository feedbackRepository;

  Future<void> getFeedbackForm({
    required String usage,
    required String id,
  }) async {
    state = FeedbackFormLoading();
    final response =
        await feedbackRepository.getFeedbackForm(usage: usage, id: id);
    response.fold((errorMessage) {
      state = FeedbackFormFailure(errorMessage: errorMessage);
    }, (responseData) {
      state = FeedbackFormSuccess(feedbackFormModel: responseData);
    });
  }
}
