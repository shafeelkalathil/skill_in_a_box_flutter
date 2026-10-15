import 'package:skill_in_a_box_flutter/features/feedback/models/feedback_response/feedback_response_model.dart';

abstract class FeedbackResponseState {
  FeedbackResponseState({this.stateSubmissionList});

  final List<Submission>? stateSubmissionList;
}

class FeedbackResponseInitial implements FeedbackResponseState {
  FeedbackResponseInitial({this.submissionList});

  final List<Submission>? submissionList;

  @override
  List<Submission>? get stateSubmissionList => submissionList;
}

class FeedbackResponseLoading implements FeedbackResponseState {
  FeedbackResponseLoading({this.submissionList});

  final List<Submission>? submissionList;

  @override
  List<Submission>? get stateSubmissionList => submissionList;
}

class FeedbackResponseSuccess implements FeedbackResponseState {
  FeedbackResponseSuccess({
    required this.submissionList,
  });

  final List<Submission>? submissionList;
  @override
  List<Submission>? get stateSubmissionList => submissionList;
}

class FeedbackResponseFailure implements FeedbackResponseState {
  FeedbackResponseFailure({
    required this.errorMessage,
    this.submissionList,
  });

  final List<Submission>? submissionList;
  final String errorMessage;

  @override
  List<Submission>? get stateSubmissionList => submissionList;
}
