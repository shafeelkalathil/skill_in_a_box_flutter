import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_details_model.g.dart';

@JsonSerializable()
class SectionDetailsModel {
  SectionDetailsModel({
    this.lessonArray,
    this.assignmentArray,
    this.quizArray,
    this.orderArray,
    this.currentLesson,
  });

  factory SectionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SectionDetailsModelFromJson(json);

  List<LessonArray>? lessonArray;
  List<DetailsArray>? assignmentArray;
  List<DetailsArray>? quizArray;
  List<OrderArray>? orderArray;
  String? currentLesson;

  Map<String, dynamic> toJson() => _$SectionDetailsModelToJson(this);
}

@JsonSerializable()
class LessonArray {
  LessonArray({this.id, this.type});

  factory LessonArray.fromJson(Map<String, dynamic> json) =>
      _$LessonArrayFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  String? type;

  Map<String, dynamic> toJson() => _$LessonArrayToJson(this);
}

@JsonSerializable()
class DetailsArray {
  DetailsArray({this.id, this.title});

  factory DetailsArray.fromJson(Map<String, dynamic> json) =>
      _$DetailsArrayFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  String? title;

  Map<String, dynamic> toJson() => _$DetailsArrayToJson(this);
}

@JsonSerializable()
class OrderArray {
  OrderArray({this.type, this.id});

  factory OrderArray.fromJson(Map<String, dynamic> json) =>
      _$OrderArrayFromJson(json);

  String? type;
  @JsonKey(name: 'Id')
  String? id;

  Map<String, dynamic> toJson() => _$OrderArrayToJson(this);
}
