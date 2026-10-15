


import 'package:skill_in_a_box_flutter/features/auth/models/sign_in/student_base_model.dart';

class StudentLoginModel {

  StudentLoginModel({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory StudentLoginModel.fromJson(Map<String, dynamic> json) =>
      StudentLoginModel(
        accessToken: json['accessToken'].toString(),
        refreshToken: json['refreshToken'].toString(),
        user: StudentBaseModel.fromJson(json['user'] as Map<String, dynamic>),
      );
  String accessToken;
  String refreshToken;
  StudentBaseModel user;

  StudentLoginModel copyWith({
    String? accessToken,
    String? refreshToken,
    StudentBaseModel? user,
  }) =>
      StudentLoginModel(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        user: user ?? this.user,
      );

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'user': user.toJson(),
  };
}
