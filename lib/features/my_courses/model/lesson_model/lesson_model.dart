import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_model.g.dart';

@JsonSerializable()
class LessonModel {
  LessonModel({this.lessonData});

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);

  LessonData? lessonData;

  Map<String, dynamic> toJson() => _$LessonModelToJson(this);
}

@JsonSerializable()
class LessonData {
  LessonData({
    this.id,
    this.type,
    this.contents,
    this.progress,
    this.isFinished,
  });

  factory LessonData.fromJson(Map<String, dynamic> json) =>
      _$LessonDataFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  String? type;
  Contents? contents;
  int? progress;
  bool? isFinished;

  Map<String, dynamic> toJson() => _$LessonDataToJson(this);
}

@JsonSerializable()
class Contents {
  Contents({this.hindi, this.english});

  factory Contents.fromJson(Map<String, dynamic> json) =>
      _$ContentsFromJson(json);

  Languague? hindi;
  Languague? english;

  Map<String, dynamic> toJson() => _$ContentsToJson(this);
}

@JsonSerializable()
class Languague {
  Languague({
    this.title,
    this.description,
    this.thumbnail,
    this.content,
    this.resources,
  });

  factory Languague.fromJson(Map<String, dynamic> json) =>
      _$LanguagueFromJson(json);

  String? title;
  String? description;
  String? thumbnail;
  Content? content;
  List<Content>? resources;

  Map<String, dynamic> toJson() => _$LanguagueToJson(this);
}

@JsonSerializable()
class Content {
  Content({this.name, this.size, this.type, this.link, this.id});

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  String? name;
  int? size;
  String? type;
  String? link;
  String? id;

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
