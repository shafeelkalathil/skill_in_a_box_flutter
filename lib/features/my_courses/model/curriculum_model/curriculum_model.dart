import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum_model.g.dart';

@JsonSerializable()
class CurriculumModel {
  CurriculumModel({
    this.curriculum,
    this.currentSection,
    this.expiryDate,
    this.finalExams,});

  factory CurriculumModel.fromJson(Map<String, dynamic> json) =>
      _$CurriculumModelFromJson(json);
  Curriculum? curriculum;
  String? currentSection;
  String? expiryDate;
  List<FinalExam>? finalExams;
  Map<String, dynamic> toJson() => _$CurriculumModelToJson(this);
}

@JsonSerializable()
class Curriculum {
  Curriculum({this.sections});

  factory Curriculum.fromJson(Map<String, dynamic> json) =>
      _$CurriculumFromJson(json);
  List<Sections>? sections;
  Map<String, dynamic> toJson() => _$CurriculumToJson(this);
}

@JsonSerializable()
class Sections {
  Sections({
    this.id,
    this.title,
    this.lessonCount,
    this.quizCount,
    this.assignmentCount,
    this.openingDate,
  });

  factory Sections.fromJson(Map<String, dynamic> json) =>
      _$SectionsFromJson(json);
  @JsonKey(name: '_id')
  String? id;
  String? title;
  int? lessonCount;
  int? quizCount;
  int? assignmentCount;
  String? openingDate;

  Map<String, dynamic> toJson() =>
      _$SectionsToJson(this);
}

@JsonSerializable()
class FinalExam {

  FinalExam({
    required this.id,
    required this.name,
    required this.startDateTime,
    required this.isLocked,
  });

  factory FinalExam.fromJson(Map<String, dynamic> json) => _$FinalExamFromJson(json);
  @JsonKey(name: '_id')
  String id;
  String name;
  DateTime startDateTime;
  bool isLocked;

  FinalExam copyWith({
    String? id,
    String? name,
    DateTime? startDateTime,
    bool? isLocked,
  }) =>
      FinalExam(
        id: id ?? this.id,
        name: name ?? this.name,
        startDateTime: startDateTime ?? this.startDateTime,
        isLocked: isLocked ?? this.isLocked,
      );

  Map<String, dynamic> toJson() => _$FinalExamToJson(this);
}
