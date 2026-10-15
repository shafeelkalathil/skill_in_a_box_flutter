// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader_board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderBoardModel _$LeaderBoardModelFromJson(Map<String, dynamic> json) =>
    LeaderBoardModel(
      students: (json['students'] as List<dynamic>)
          .map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeaderBoardModelToJson(LeaderBoardModel instance) =>
    <String, dynamic>{
      'students': instance.students,
    };
