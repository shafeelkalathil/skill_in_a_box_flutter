

import 'package:freezed_annotation/freezed_annotation.dart';

part 'doubt_box_section_details_model.g.dart';

@JsonSerializable()
class DoubtBoxSectionDetailsModel {
  DoubtBoxSectionDetailsModel({this.doubtBoxData});

  factory DoubtBoxSectionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DoubtBoxSectionDetailsModelFromJson(json);

  List<DoubtBoxData>? doubtBoxData;

  Map<String, dynamic> toJson() => _$DoubtBoxSectionDetailsModelToJson(this);
}

@JsonSerializable()
class DoubtBoxData {
  DoubtBoxData({
    this.id,
    this.question,
    this.answer,
    this.answerType,
    this.likes,
    this.dislikes,
    this.isPublic,
    this.answerFile,
    this.isLiked,
    this.isDisliked,
  });

  factory DoubtBoxData.fromJson(Map<String, dynamic> json) =>
      _$DoubtBoxDataFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  String? question;
  String? answer;
  String? answerType;
  int? likes;
  int? dislikes;
  bool? isPublic;
  AnswerFile? answerFile;
  bool? isLiked;
  bool? isDisliked;

  Map<String, dynamic> toJson() => _$DoubtBoxDataToJson(this);
}

@JsonSerializable()
class AnswerFile {
  AnswerFile({this.name, this.size, this.type, this.link, this.id});

  factory AnswerFile.fromJson(Map<String, dynamic> json) =>
      _$AnswerFileFromJson(json);

  String? name;
  int? size;
  String? type;
  String? link;
  String? id;

  Map<String, dynamic> toJson() => _$AnswerFileToJson(this);
}
