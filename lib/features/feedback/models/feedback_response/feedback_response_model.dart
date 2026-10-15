import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_response_model.g.dart';

@JsonSerializable()
class FeedbackResponseModel {
 FeedbackResponseModel({
   this.submission,
   this.courseId,
 });

 factory FeedbackResponseModel.fromJson(Map<String, dynamic> json) =>
     _$FeedbackResponseModelFromJson(json);

 final List<Submission>? submission;
 final String? courseId;

 Map<String, dynamic> toJson() => _$FeedbackResponseModelToJson(this);
}

@JsonSerializable()
class Submission {
 Submission({
   this.questionId,
   this.submittedAnswer,
 });

 factory Submission.fromJson(Map<String, dynamic> json) =>
     _$SubmissionFromJson(json);

 final String? questionId;
 final List<String>? submittedAnswer;

 Map<String, dynamic> toJson() => _$SubmissionToJson(this);
}