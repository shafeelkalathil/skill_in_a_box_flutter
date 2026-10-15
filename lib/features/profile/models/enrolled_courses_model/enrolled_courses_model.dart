import 'package:freezed_annotation/freezed_annotation.dart';

part 'enrolled_courses_model.g.dart';

@JsonSerializable()
class EnrolledCourses {
  EnrolledCourses({this.course});

  factory EnrolledCourses.fromJson(Map<String, dynamic> json) =>
      _$EnrolledCoursesFromJson(json);

  List<Course>? course;

  Map<String, dynamic> toJson() => _$EnrolledCoursesToJson(this);
}

@JsonSerializable()
class Course {
  Course(
      {this.id,
      this.progress,
      this.status,
      this.courseDetails,
      this.batchDetails,});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  int? progress;
  String? status;
  CourseDetails? courseDetails;
  BatchDetails? batchDetails;

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class CourseDetails {
  CourseDetails({this.id, this.title});

  factory CourseDetails.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  String? title;
  Map<String, dynamic> toJson() => _$CourseDetailsToJson(this);
}

@JsonSerializable()
class BatchDetails {
  BatchDetails({this.id, this.batchId});

  factory BatchDetails.fromJson(Map<String, dynamic> json) =>
      _$BatchDetailsFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  String? batchId;

  Map<String, dynamic> toJson() => _$BatchDetailsToJson(this);
}
