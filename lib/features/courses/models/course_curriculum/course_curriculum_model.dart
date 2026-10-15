
class CourseCurriculumModel {
  CourseCurriculumModel({
    required this.sections,
  });

  factory CourseCurriculumModel.fromJson(Map<String, dynamic> json) =>
      CourseCurriculumModel(
        sections: List<CurriculumSectionModel>.from(
          (json['sections'] as List<dynamic>).map((x) => CurriculumSectionModel
              .fromJson(x as Map<String, dynamic>),),),
  );
  List<CurriculumSectionModel> sections;

  CourseCurriculumModel copyWith({
    List<CurriculumSectionModel>? sections,
  }) =>
      CourseCurriculumModel(
        sections: sections ?? this.sections,
      );

  Map<String, dynamic> toJson() => {
    'sections': List<dynamic>.from(sections.map((x) => x.toJson())),
  };
}



class CurriculumSectionModel {

  CurriculumSectionModel({
    required this.id,
    required this.title,
    required this.lessonCount,
    required this.quizCount,
    required this.assignmentCount,
  });

  factory CurriculumSectionModel.fromJson(Map<String, dynamic> json) =>
      CurriculumSectionModel(
        id: json['_id'].toString(),
        title: json['title'].toString(),
        lessonCount: (json['lessonCount'] is int)
            ? json['lessonCount'] as int
            : int.tryParse(json['lessonCount'].toString()) ?? 0,
        quizCount: (json['quizCount'] is int)
            ? json['quizCount'] as int
            : int.tryParse(json['quizCount'].toString()) ?? 0,
        assignmentCount: (json['assignmentCount'] is int)
            ? json['assignmentCount'] as int
            : int.tryParse(json['assignmentCount'].toString()) ?? 0,
  );
  String id;
  String title;
  int lessonCount;
  int quizCount;
  int assignmentCount;

  CurriculumSectionModel copyWith({
    String? id,
    String? title,
    int? lessonCount,
    int? quizCount,
    int? assignmentCount,
  }) =>
      CurriculumSectionModel(
        id: id ?? this.id,
        title: title ?? this.title,
        lessonCount: lessonCount ?? this.lessonCount,
        quizCount: quizCount ?? this.quizCount,
        assignmentCount: assignmentCount ?? this.assignmentCount,
      );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'title': title,
    'lessonCount': lessonCount,
    'quizCount': quizCount,
    'assignmentCount': assignmentCount,
  };
}
