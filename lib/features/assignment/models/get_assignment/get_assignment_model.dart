

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_assignment_model.g.dart';

@JsonSerializable()
class GetAssignmentModel {
  GetAssignmentModel({this.courseId, this.sectionId});

  final String? courseId;
  final String? sectionId;

  Map<String, dynamic> toJson() => _$GetAssignmentModelToJson(this);
}
