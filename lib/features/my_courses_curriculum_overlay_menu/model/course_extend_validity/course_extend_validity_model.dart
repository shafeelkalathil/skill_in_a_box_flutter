
import 'package:freezed_annotation/freezed_annotation.dart';
part 'course_extend_validity_model.g.dart';
@JsonSerializable()
class CourseExtendValidityModel {

  CourseExtendValidityModel({
    required this.orderId,
    required this.amount,
  });

  factory CourseExtendValidityModel.fromJson(Map<String, dynamic> json) =>
      _$CourseExtendValidityModelFromJson(json);
  String orderId;
  int amount;

  CourseExtendValidityModel copyWith({
    String? orderId,
    int? amount,
  }) =>
      CourseExtendValidityModel(
        orderId: orderId ?? this.orderId,
        amount: amount ?? this.amount,
      );

  Map<String, dynamic> toJson() => _$CourseExtendValidityModelToJson(this);
}
