import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_assignment_model.g.dart';

@JsonSerializable()
class UploadAssignmentModel {
  UploadAssignmentModel({
    this.assignmentId,
    this.courseId,
    this.type,
    this.sectionId,
    this.submissionData,
  });

  factory UploadAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$UploadAssignmentModelFromJson(json);

  final String? assignmentId;
  final String? courseId;
  final String? type;
  final String? sectionId;
  final SubmissionData? submissionData;

  Map<String, dynamic> toJson() => _$UploadAssignmentModelToJson(this);
}

@JsonSerializable()
class SubmissionData {
  SubmissionData({this.files, this.date});

  factory SubmissionData.fromJson(Map<String, dynamic> json) =>
      _$SubmissionDataFromJson(json);

  final List<Files>? files;
  final String? date;

  Map<String, dynamic> toJson() => _$SubmissionDataToJson(this);
}

@JsonSerializable()
class Files {
  Files({this.name, this.type, this.link, this.size, this.id});

  factory Files.fromJson(Map<String, dynamic> json) => _$FilesFromJson(json);

  final String? name;
  final String? type;
  final String? link;
  final int? size;
  final String? id;

  Map<String, dynamic> toJson() => _$FilesToJson(this);
}
