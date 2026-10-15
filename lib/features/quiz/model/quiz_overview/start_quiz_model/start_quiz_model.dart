
import 'package:freezed_annotation/freezed_annotation.dart';
part 'start_quiz_model.g.dart';
@JsonSerializable()
class StartQuizModel {

  StartQuizModel({
    required this.message,
  });

  factory StartQuizModel.fromJson(Map<String, dynamic> json) =>
      _$StartQuizModelFromJson(json);
  String message;

  StartQuizModel copyWith({
    String? message,
  }) =>
      StartQuizModel(
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() =>
      _$StartQuizModelToJson(this);
}
