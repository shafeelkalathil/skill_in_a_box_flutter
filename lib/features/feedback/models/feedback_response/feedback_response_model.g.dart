// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackResponseModel _$FeedbackResponseModelFromJson(
        Map<String, dynamic> json) =>
    FeedbackResponseModel(
      submission: (json['submission'] as List<dynamic>?)
          ?.map((e) => Submission.fromJson(e as Map<String, dynamic>))
          .toList(),
      courseId: json['courseId'] as String?,
    );

Map<String, dynamic> _$FeedbackResponseModelToJson(
        FeedbackResponseModel instance) =>
    <String, dynamic>{
      'submission': instance.submission,
      'courseId': instance.courseId,
    };

Submission _$SubmissionFromJson(Map<String, dynamic> json) => Submission(
      questionId: json['questionId'] as String?,
      submittedAnswer: (json['submittedAnswer'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SubmissionToJson(Submission instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'submittedAnswer': instance.submittedAnswer,
    };
