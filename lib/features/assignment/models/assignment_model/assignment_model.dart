import 'package:freezed_annotation/freezed_annotation.dart';

part 'assignment_model.g.dart';

@JsonSerializable()
class AssignmentModel {
  AssignmentModel({this.assignment});

  factory AssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentModelFromJson(json);

  final Assignment? assignment;

  Map<String, dynamic> toJson() => _$AssignmentModelToJson(this);
}

@JsonSerializable()
class Assignment {
  Assignment({
    this.id,
    this.title,
    this.content,
    this.totalMark,
    this.attachments,
    this.dueDays,
    this.status,
    this.graded,
    this.submittedData,
    this.previousSubmit,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);

  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final Content? content;
  final int? totalMark;
  final List<Attachments>? attachments;
  final String? dueDays;
  final String? status;
  final bool? graded;
  final SubmittedData? submittedData;
  final SubmittedData? previousSubmit;

  Map<String, dynamic> toJson() => _$AssignmentToJson(this);
}

@JsonSerializable()
class Content {
  Content({this.hindi, this.english});

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  final Language? hindi;
  final Language? english;

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class Language {
  Language({this.question});

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);

  final String? question;

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

@JsonSerializable()
class Attachments {
  Attachments({this.name, this.size, this.type, this.link, this.id});

  factory Attachments.fromJson(Map<String, dynamic> json) =>
      _$AttachmentsFromJson(json);

  final String? name;
  final int? size;
  final String? type;
  final String? link;
  final String? id;

  Map<String, dynamic> toJson() => _$AttachmentsToJson(this);
}

@JsonSerializable()
class SubmittedData {
  SubmittedData({this.files, this.date, this.feedback, this.mark});

  factory SubmittedData.fromJson(Map<String, dynamic> json) =>
      _$SubmittedDataFromJson(json);

  final List<Files>? files;
  final String? date;
  final String? feedback;
  final int? mark;

  Map<String, dynamic> toJson() => _$SubmittedDataToJson(this);
}

@JsonSerializable()
class Files {
  Files({this.name, this.size, this.type, this.link, this.id});

  factory Files.fromJson(Map<String, dynamic> json) => _$FilesFromJson(json);

  final String? name;
  final int? size;
  final String? type;
  final String? link;
  final String? id;

  Map<String, dynamic> toJson() => _$FilesToJson(this);
}
