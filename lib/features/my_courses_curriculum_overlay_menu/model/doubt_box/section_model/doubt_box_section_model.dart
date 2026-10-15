import 'package:freezed_annotation/freezed_annotation.dart';

part 'doubt_box_section_model.g.dart';

@JsonSerializable()
class DoubtBoxSectionModel {
  DoubtBoxSectionModel({this.sectionData});

  factory DoubtBoxSectionModel.fromJson(Map<String, dynamic> json) =>
      _$DoubtBoxSectionModelFromJson(json);

  List<SectionData>? sectionData;

  Map<String, dynamic> toJson() => _$DoubtBoxSectionModelToJson(this);
}

@JsonSerializable()
class SectionData {
  SectionData({this.id, this.title, this.sessionId});

  factory SectionData.fromJson(Map<String, dynamic> json) =>
      _$SectionDataFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? sessionId;

  Map<String, dynamic> toJson() => _$SectionDataToJson(this);
}
