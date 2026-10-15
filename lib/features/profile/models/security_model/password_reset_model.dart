import 'package:freezed_annotation/freezed_annotation.dart';
part 'password_reset_model.g.dart';

@JsonSerializable()
class PassWordResetModel {
  PassWordResetModel({this.password, this.newPassword, this.confirmPassword});

  String? password;
  String? newPassword;
  String? confirmPassword;

  Map<String, dynamic> toJson() => _$PassWordResetModelToJson(this);
}
