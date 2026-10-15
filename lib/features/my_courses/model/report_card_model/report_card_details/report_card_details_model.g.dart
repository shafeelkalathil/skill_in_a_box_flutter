// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_card_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportCardDetailsModel _$ReportCardDetailsModelFromJson(
        Map<String, dynamic> json) =>
    ReportCardDetailsModel(
      reportCard: json['reportCard'] == null
          ? null
          : ReportCard.fromJson(json['reportCard'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportCardDetailsModelToJson(
        ReportCardDetailsModel instance) =>
    <String, dynamic>{
      'reportCard': instance.reportCard,
    };

ReportCard _$ReportCardFromJson(Map<String, dynamic> json) => ReportCard(
      id: json['_id'] as String?,
      sectionId: json['sectionId'] as String?,
      reportDate: json['reportDate'] as String?,
      totalLesson: (json['totalLesson'] as num?)?.toInt(),
      completedLesson: (json['completedLesson'] as num?)?.toInt(),
      quizAttended: (json['quizAttended'] as num?)?.toInt(),
      totalQuizMark: (json['totalQuizMark'] as num?)?.toInt(),
      obtainedQuizMark: (json['obtainedQuizMark'] as num?)?.toInt(),
      assignmentSubmitted: (json['assignmentSubmitted'] as num?)?.toInt(),
      totalAssignmentMark: (json['totalAssignmentMark'] as num?)?.toInt(),
      obtainedAssignmentMark: (json['obtainedAssignmentMark'] as num?)?.toInt(),
      liveSessionFeedback: json['liveSessionFeedback'] as String?,
      studentFirstName: json['studentFirstName'] as String?,
      studentLastName: json['studentLastName'] as String?,
      studentProfilePic: json['studentProfilePic'] as String?,
      courseTitle: json['courseTitle'] as String?,
    );

Map<String, dynamic> _$ReportCardToJson(ReportCard instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sectionId': instance.sectionId,
      'reportDate': instance.reportDate,
      'totalLesson': instance.totalLesson,
      'completedLesson': instance.completedLesson,
      'quizAttended': instance.quizAttended,
      'totalQuizMark': instance.totalQuizMark,
      'obtainedQuizMark': instance.obtainedQuizMark,
      'assignmentSubmitted': instance.assignmentSubmitted,
      'totalAssignmentMark': instance.totalAssignmentMark,
      'obtainedAssignmentMark': instance.obtainedAssignmentMark,
      'liveSessionFeedback': instance.liveSessionFeedback,
      'studentFirstName': instance.studentFirstName,
      'studentLastName': instance.studentLastName,
      'studentProfilePic': instance.studentProfilePic,
      'courseTitle': instance.courseTitle,
    };
