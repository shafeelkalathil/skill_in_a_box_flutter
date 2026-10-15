import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_model.g.dart';

@JsonSerializable()
class NotesModel {
  NotesModel({this.note});

  factory NotesModel.fromJson(Map<String, dynamic> json) =>
      _$NotesModelFromJson(json);

  List<String>? note;
}

@JsonSerializable()
class GetNotesModel {
  GetNotesModel({this.lessonId, this.courseId, this.sectionId});

  String? lessonId;
  String? courseId;
  String? sectionId;

  Map<String, dynamic> toJson() => _$GetNotesModelToJson(this);
}

@JsonSerializable()
class SaveNoteModel {
  SaveNoteModel({this.courseId, this.sectionId, this.note});
  String? courseId;
  String? sectionId;
  String? note;
  Map<String, dynamic> toJson() => _$SaveNoteModelToJson(this);
}

@JsonSerializable()
class UpdateNoteModel {
  UpdateNoteModel({this.courseId, this.sectionId, this.note});

  String? courseId;
  String? sectionId;
  List<String>? note;

  Map<String, dynamic> toJson() => _$UpdateNoteModelToJson(this);
}
