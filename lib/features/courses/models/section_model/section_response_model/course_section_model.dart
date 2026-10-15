import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_section_model.g.dart';

@JsonSerializable()
class CourseSectionModel {
  CourseSectionModel({
    this.lessonArray,
    this.assignmentArray,
    this.quizArray,
    this.orderArray,
  });

  factory CourseSectionModel.fromJson(Map<String, dynamic> json) =>
      _$CourseSectionModelFromJson(json);

  final List<LessonArray>? lessonArray;
  final List<AssignmentArray>? assignmentArray;
  final List<QuizArray>? quizArray;
  final List<OrderArray>? orderArray;

  Map<String, dynamic> toJson() => _$CourseSectionModelToJson(this);
}

@JsonSerializable()
class LessonArray {
  LessonArray({
    this.id,
    this.type,
    this.title,
  });

  factory LessonArray.fromJson(Map<String, dynamic> json) =>
      _$LessonArrayFromJson(json);

  @JsonKey(name: '_id')
  final String? id;
  final String? type;
  final String? title;

  Map<String, dynamic> toJson() => _$LessonArrayToJson(this);
}

@JsonSerializable()
class AssignmentArray {
  AssignmentArray({
    this.id,
    this.title,
  });

  factory AssignmentArray.fromJson(Map<String, dynamic> json) =>
      _$AssignmentArrayFromJson(json);

  @JsonKey(name: '_id')
  final String? id;
  final String? title;

  Map<String, dynamic> toJson() => _$AssignmentArrayToJson(this);
}

@JsonSerializable()
class QuizArray {
  QuizArray({
    this.id,
    this.title,
  });

  factory QuizArray.fromJson(Map<String, dynamic> json) =>
      _$QuizArrayFromJson(json);

  @JsonKey(name: '_id')
  final String? id;
  final String? title;

  Map<String, dynamic> toJson() => _$QuizArrayToJson(this);
}

@JsonSerializable()
class OrderArray {
  OrderArray({
    this.type,
    this.id,
  });

  factory OrderArray.fromJson(Map<String, dynamic> json) =>
      _$OrderArrayFromJson(json);

  final String? type;
  @JsonKey(name: 'Id')
  final String? id;

  Map<String, dynamic> toJson() => _$OrderArrayToJson(this);
}
