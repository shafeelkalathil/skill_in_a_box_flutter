import 'package:freezed_annotation/freezed_annotation.dart';
part 'student.g.dart';

@JsonSerializable()
class Student {

  Student({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.points,
    required this.progress,
    required this.id,
  });

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  String firstName;
  String lastName;
  String email;
  int points;
  int progress;
  @JsonKey(name: '_id')
  String id;

  Student copyWith({
    String? firstName,
    String? lastName,
    String? email,
    int? points,
    int? progress,
    String? id,
  }) =>
      Student(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        points: points ?? this.points,
        progress: progress ?? this.progress,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
