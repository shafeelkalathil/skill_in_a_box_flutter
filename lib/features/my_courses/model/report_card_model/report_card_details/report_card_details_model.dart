import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_card_details_model.g.dart';

@JsonSerializable()
class ReportCardDetailsModel {
 ReportCardDetailsModel({this.reportCard});

 factory ReportCardDetailsModel.fromJson(Map<String, dynamic> json) =>
     _$ReportCardDetailsModelFromJson(json);

 final ReportCard? reportCard;

 Map<String, dynamic> toJson() => _$ReportCardDetailsModelToJson(this);
}

@JsonSerializable()
class ReportCard {
 ReportCard({
   this.id,
   this.sectionId,
   this.reportDate,
   this.totalLesson,
   this.completedLesson,
   this.quizAttended,
   this.totalQuizMark,
   this.obtainedQuizMark,
   this.assignmentSubmitted,
   this.totalAssignmentMark,
   this.obtainedAssignmentMark,
   this.liveSessionFeedback,
   this.studentFirstName,
   this.studentLastName,
   this.studentProfilePic,
   this.courseTitle,
 });

 factory ReportCard.fromJson(Map<String, dynamic> json) =>
     _$ReportCardFromJson(json);

 @JsonKey(name: '_id')
 final String? id;
 final String? sectionId;
 final String? reportDate;
 final int? totalLesson;
 final int? completedLesson;
 final int? quizAttended;
 final int? totalQuizMark;
 final int? obtainedQuizMark;
 final int? assignmentSubmitted;
 final int? totalAssignmentMark;
 final int? obtainedAssignmentMark;
 final String? liveSessionFeedback;
 final String? studentFirstName;
 final String? studentLastName;
 final String? studentProfilePic;
 final String? courseTitle;

 Map<String, dynamic> toJson() => _$ReportCardToJson(this);
}
