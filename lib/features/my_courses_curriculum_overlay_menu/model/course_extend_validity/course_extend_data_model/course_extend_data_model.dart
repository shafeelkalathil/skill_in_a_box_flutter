import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_extend_data_model.g.dart';
@JsonSerializable()
class CourseExtendDataModel {

  CourseExtendDataModel({
    required this.extendFees,
    required this.courseValidity, this.courseCancellationFee,
  });

  factory CourseExtendDataModel.fromJson(Map<String, dynamic> json) =>
      _$CourseExtendDataModelFromJson(json);
  ExtendFees extendFees;
  int? courseCancellationFee;
  DateTime courseValidity;

  CourseExtendDataModel copyWith({
    ExtendFees? extendFees,
    DateTime? courseValidity,
    int? courseCancellationFee,
  }) =>
      CourseExtendDataModel(
        extendFees: extendFees ?? this.extendFees,
        courseValidity: courseValidity ?? this.courseValidity,
        courseCancellationFee: courseCancellationFee
            ?? this.courseCancellationFee,
      );

  Map<String, dynamic> toJson() => _$CourseExtendDataModelToJson(this);
}

@JsonSerializable()
class ExtendFees {

  ExtendFees({
    required this.oneMonthExtensionFee,
    required this.threeMonthExtensionFee,
    required this.sixMonthExtensionFee,
    required this.oneYearExtensionFee,
  });

  factory ExtendFees.fromJson(Map<String, dynamic> json) =>
      _$ExtendFeesFromJson(json);
  int oneMonthExtensionFee;
  int threeMonthExtensionFee;
  int sixMonthExtensionFee;
  int oneYearExtensionFee;

  ExtendFees copyWith({
    int? oneMonthExtensionFee,
    int? threeMonthExtensionFee,
    int? sixMonthExtensionFee,
    int? oneYearExtensionFee,
  }) =>
      ExtendFees(
        oneMonthExtensionFee: oneMonthExtensionFee ?? this.oneMonthExtensionFee,
        threeMonthExtensionFee: threeMonthExtensionFee
            ?? this.threeMonthExtensionFee,
        sixMonthExtensionFee: sixMonthExtensionFee ?? this.sixMonthExtensionFee,
        oneYearExtensionFee: oneYearExtensionFee ?? this.oneYearExtensionFee,
      );

  Map<String, dynamic> toJson() => _$ExtendFeesToJson(this);
}
