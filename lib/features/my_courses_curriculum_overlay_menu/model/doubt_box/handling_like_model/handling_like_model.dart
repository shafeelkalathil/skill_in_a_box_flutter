import 'package:freezed_annotation/freezed_annotation.dart';

part 'handling_like_model.g.dart';

@JsonSerializable()
class HandlingLikeModel {
  HandlingLikeModel({this.courseId, this.sectionId, this.type});

  String? courseId;
  String? sectionId;
  String? type;

  Map<String, dynamic> toJson() => _$HandlingLikeModelToJson(this);
}
