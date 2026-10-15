
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resubmit_request_model.g.dart';

@JsonSerializable()
class ResubmitRequestModel {

  const ResubmitRequestModel({
    this.assignmentId,
    this.sectionId,
    this.courseId,
    this.type,
  });

  factory ResubmitRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResubmitRequestModelFromJson(json);
  final String? assignmentId;
  final String? sectionId;
  final String? courseId;
  final String? type;

  Map<String, dynamic> toJson() => _$ResubmitRequestModelToJson(this);
}
