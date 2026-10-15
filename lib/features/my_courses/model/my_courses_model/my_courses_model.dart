import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_courses_model.g.dart';

@JsonSerializable()
class MyCourseModel {
  MyCourseModel({this.courses});

  factory MyCourseModel.fromJson(Map<String, dynamic> json) =>
      _$MyCourseModelFromJson(json);

  List<Courses>? courses;

  Map<String, dynamic> toJson() => _$MyCourseModelToJson(this);
}

@JsonSerializable()
class Courses {
  Courses({
    this.id,
    this.hasBatchId,
    this.courseDetails,
    this.status,
    this.isCertified,
    this.progress,
    this.totalCombinedCount,
    this.pricing,
  });

  factory Courses.fromJson(Map<String, dynamic> json) =>
      _$CoursesFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  bool? hasBatchId;
  CourseDetails? courseDetails;
  String? status;
  bool? isCertified;
  Progress? progress;
  int? totalCombinedCount;
  Pricing? pricing;

  Map<String, dynamic> toJson() => _$CoursesToJson(this);
}

@JsonSerializable()
class CourseDetails {
  CourseDetails({
    this.id,
    this.title,
    this.trailer,
    this.thumbnail,
    this.description,
    this.courseOutput,
    this.requirement,
    this.curriculum,
    this.type,
  });

  factory CourseDetails.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  String? title;
  List<Trailer>? trailer;
  String? thumbnail;
  String? description;
  List<String>? courseOutput;
  List<String>? requirement;
  Curriculum? curriculum;
  String? type; 

  Map<String, dynamic> toJson() => _$CourseDetailsToJson(this);
}

@JsonSerializable()
class Trailer {
  Trailer({this.name, this.size, this.type, this.link, this.id});

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);

  String? name;
  int? size;
  String? type;
  String? link;
  @JsonKey(name: '_id')
  String? id;

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}

@JsonSerializable()
class Curriculum {
  Curriculum({this.sections});

  factory Curriculum.fromJson(Map<String, dynamic> json) =>
      _$CurriculumFromJson(json);
  List<String>? sections;
  Map<String, dynamic> toJson() => _$CurriculumToJson(this);
}

@JsonSerializable()
class Progress {
  Progress({
    this.currentLesson,
    this.currentSection,
    this.totalContent,
    this.completedContent,
  });

  factory Progress.fromJson(Map<String, dynamic> json) =>
      _$ProgressFromJson(json);

  CurrentLesson? currentLesson;
  CurrentSection? currentSection;
  int? totalContent;
  int? completedContent;

  Map<String, dynamic> toJson() => _$ProgressToJson(this);
}

@JsonSerializable()
class CurrentLesson {
  CurrentLesson({this.lessonId, this.lessonTitle});

  factory CurrentLesson.fromJson(Map<String, dynamic> json) =>
      _$CurrentLessonFromJson(json);

  String? lessonId;
  String? lessonTitle;

  Map<String, dynamic> toJson() => _$CurrentLessonToJson(this);
}

@JsonSerializable()
class CurrentSection {
  CurrentSection({this.sectionId, this.sectionTitle});

  factory CurrentSection.fromJson(Map<String, dynamic> json) =>
      _$CurrentSectionFromJson(json);
  String? sectionId;
  String? sectionTitle;

  Map<String, dynamic> toJson() => _$CurrentSectionToJson(this);
}

@JsonSerializable()
class Pricing {
  Pricing({this.type, this.indian, this.overseas});

  factory Pricing.fromJson(Map<String, dynamic> json) =>
      _$PricingFromJson(json);
  String? type;
  Indian? indian;
  Overseas? overseas;
  Map<String, dynamic> toJson() => _$PricingToJson(this);
}

@JsonSerializable()
class Indian {
  Indian({
    this.totalAmount,
    this.discount,
    this.registrationAmount,
    this.courseFee,
    this.installment,
    this.loan,
  });

  factory Indian.fromJson(Map<String, dynamic> json) => _$IndianFromJson(json);

  int? totalAmount;
  int? discount;
  int? registrationAmount;
  int? courseFee;
  Installment? installment;
  Loan? loan;

  Map<String, dynamic> toJson() => _$IndianToJson(this);
}

@JsonSerializable()
class Installment {
  Installment({this.isAvailable, this.totalCount, this.installments});

 factory Installment.fromJson(Map<String, dynamic> json) =>
      _$InstallmentFromJson(json);

  bool? isAvailable;
  int? totalCount;
  List<Installments>? installments;

  Map<String, dynamic> toJson() => _$InstallmentToJson(this);
}

@JsonSerializable()
class Installments {
  Installments({this.name, this.amount});

  factory Installments.fromJson(Map<String, dynamic> json) =>
      _$InstallmentsFromJson(json);

  String? name;
  int? amount;

  Map<String, dynamic> toJson() => _$InstallmentsToJson(this);
}

@JsonSerializable()
class Loan {
  Loan({this.isAvailable, this.document});

  factory Loan.fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);
  bool? isAvailable;
  List<String>? document;
  Map<String, dynamic> toJson() => _$LoanToJson(this);
}

@JsonSerializable()
class Overseas {
  Overseas({
    this.totalAmount,
    this.discount,
    this.registrationAmount,
    this.courseFee,
  });

  factory Overseas.fromJson(Map<String, dynamic> json) =>
      _$OverseasFromJson(json);

  int? totalAmount;
  int? discount;
  int? registrationAmount;
  int? courseFee;

  Map<String, dynamic> toJson() => _$OverseasToJson(this);
}
