import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/leader_board_model/student/student.dart';
part 'leader_board_model.g.dart';
@JsonSerializable()
class LeaderBoardModel {

  LeaderBoardModel({
    required this.students,
  });

  factory LeaderBoardModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderBoardModelFromJson(json);
  List<Student> students;

  LeaderBoardModel copyWith({
    List<Student>? students,
  }) =>
      LeaderBoardModel(
        students: students ?? this.students,
      );

  Map<String, dynamic> toJson() => _$LeaderBoardModelToJson(this);

}
