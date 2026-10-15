import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_details_request_model.g.dart';

@JsonSerializable()
class SectionDetailsRequestModel {
  SectionDetailsRequestModel({this.sectionId, this.courseId});

  String? sectionId;
  String? courseId;

  Map<String, dynamic> toJson() => _$SectionDetailsRequestModelToJson(this);
}
