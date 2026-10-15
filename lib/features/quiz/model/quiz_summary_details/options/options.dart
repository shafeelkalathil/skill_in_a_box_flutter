import 'package:freezed_annotation/freezed_annotation.dart';
part 'options.g.dart';
@JsonSerializable()
class Option {

  Option({
    required this.option,
    required this.id,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  String option;
  String id;

  Option copyWith({
    String? option,
    String? id,
  }) =>
      Option(
        option: option ?? this.option,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
