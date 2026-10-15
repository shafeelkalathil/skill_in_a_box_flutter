
import 'package:freezed_annotation/freezed_annotation.dart';
part 'course_overview_model.g.dart';

@JsonSerializable()
class CourseOverviewModel {

  CourseOverviewModel({
    this.description,
    this.courseOutput,
    this.requirement,
    this.trailer,
    this.thumbnail,
    this.courseFee,
    this.discount,
    this.lessons,
    this.access,
    this.title,
    this.registrationAmount,
    this.type,
  });

  factory CourseOverviewModel.fromJson(Map<String, dynamic> json) =>
      _$CourseOverviewModelFromJson(json);
  String? description;
  List<String>? courseOutput;
  List<String>? requirement;
  List<Trailer>? trailer;
  String? thumbnail;
  int? courseFee;
  int? discount;
  int? lessons;
  String? access;
  String? title;
  int? registrationAmount;
  String? type;

  CourseOverviewModel copyWith({
    String? description,
    List<String>? courseOutput,
    List<String>? requirement,
    List<Trailer>? trailer,
    String? thumbnail,
    int? courseFee,
    int? discount,
    int? lessons,
    String? access,
    String? title,
    int? registrationAmount,
    String? type,
  }) =>
      CourseOverviewModel(
        description: description ?? this.description,
        courseOutput: courseOutput ?? this.courseOutput,
        requirement: requirement ?? this.requirement,
        trailer: trailer ?? this.trailer,
        thumbnail: thumbnail ?? this.thumbnail,
        courseFee: courseFee ?? this.courseFee,
        discount: discount ?? this.discount,
        lessons: lessons ?? this.lessons,
        access: access ?? this.access,
        title: title ?? this.title,
        registrationAmount: registrationAmount ?? this.registrationAmount,
        type: type ?? this.type,
      );

  Map<String, dynamic> toJson() =>
      _$CourseOverviewModelToJson(this);
}


@JsonSerializable()
class Trailer {

  Trailer({
    this.name,
    this.size,
    this.type,
    this.link,
    this.id,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);
  String? name;
  int? size;
  String? type;
  String? link;
  String? id;

  Trailer copyWith({
    String? name,
    int? size,
    String? type,
    String? link,
    String? id,
  }) =>
      Trailer(
        name: name ?? this.name,
        size: size ?? this.size,
        type: type ?? this.type,
        link: link ?? this.link,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() =>
      _$TrailerToJson(this);

}
