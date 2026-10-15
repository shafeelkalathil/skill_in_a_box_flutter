import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_request_model.g.dart';

@JsonSerializable()
class SectionRequestModel {
 SectionRequestModel({
   this.sectionId,
   this.courseId,
 });

 factory SectionRequestModel.fromJson(Map<String, dynamic> json) =>
     _$SectionRequestModelFromJson(json);

 final String? sectionId;
 final String? courseId;

 Map<String, dynamic> toJson() => _$SectionRequestModelToJson(this);
}
