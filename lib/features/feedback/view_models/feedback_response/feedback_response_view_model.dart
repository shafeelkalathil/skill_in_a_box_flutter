import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/feedback/models/feedback_response/feedback_response_model.dart';
import 'package:skill_in_a_box_flutter/features/feedback/repositories/feedback_repository.dart';
import 'package:skill_in_a_box_flutter/features/feedback/view_models/feedback_response/feedback_response_states.dart';

final feedbackResponseViewmodelProvider =
    StateNotifierProvider<FeedbackResponseViewmodel, FeedbackResponseState>(
  (ref) => FeedbackResponseViewmodel(ref.watch(feedbackRepositoryProvider)),
);

class FeedbackResponseViewmodel extends StateNotifier<FeedbackResponseState> {
  FeedbackResponseViewmodel(this.feedbackRepository)
      : super(FeedbackResponseInitial());

  final FeedbackRepository feedbackRepository;

  //  Future<void> submitFeedback({bool isRefreshing = false}) async {
  //   if (isRefreshing || state.data == null) {
  //     state = FeedbackResponseLoading(feedbackResponse: state.data);
  //   }
  //   final response = await feedbackRepository.repositoryMethod();
  //   response.fold((errorMessage) {
  //     state = FeedbackResponseFailure(errorMessage, feedbackResponse: state.data);
  //   }, (responsData) {
  //     state = FeedbackResponseSuccess(feedbackResponse: responsData);
  //   });
  // }

  void updateSubmissionList(Submission incomingSubmission) {
    final currentSubmissionList = state.stateSubmissionList ?? [];
    if (incomingSubmission.questionId != null) {
      final existingIndex = currentSubmissionList.indexWhere(
        (submission) => submission.questionId == incomingSubmission.questionId,
      );
      if (existingIndex != -1) {
        currentSubmissionList[existingIndex] = incomingSubmission;
      } else {
        currentSubmissionList.add(incomingSubmission);
      }
    }
    state = FeedbackResponseInitial(submissionList: currentSubmissionList);
  }

  bool isAnswerEmpty(String questionId) {
    if (state.stateSubmissionList != null) {
      try {
        final submission = state.stateSubmissionList!.firstWhere(
          (submission) => submission.questionId == questionId,
          orElse: Submission.new,
        );
        if (submission.questionId == null) {
          return true;
        }

        return submission.submittedAnswer == null ||
            submission.submittedAnswer!.isEmpty;
      } catch (e) {
        return true;
      }
    }
    return true;
  }
}
