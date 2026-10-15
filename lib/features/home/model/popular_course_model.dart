
import 'package:skill_in_a_box_flutter/features/home/model/validity_model.dart';

class PopularCourseModel {

  PopularCourseModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.courseFee,
    required this.totalPrice,
    required this.validity,
    required this.type,
  });

  factory PopularCourseModel.fromJson(Map<String, dynamic> json) =>
      PopularCourseModel(
        id: json['_id'].toString(),
        title: json['title'].toString(),
        thumbnail: json['thumbnail'].toString(),
        courseFee: (json['totalPrice'] is int)
            ? json['courseFee'] as int
            : int.tryParse(json['courseFee'].toString()) ?? 0,
        totalPrice: (json['totalPrice'] is int)
            ? json['totalPrice'] as int
            : int.tryParse(json['totalPrice'].toString()) ?? 0,
        validity: ValidityModel.fromJson(
            json['validity'] as Map<String,dynamic>,),
        type: json['type'].toString(),
  );
  String id;
  String title;
  String thumbnail;
  String type;
  int courseFee;
  int totalPrice;
  ValidityModel validity;

  PopularCourseModel copyWith({
    String? id,
    String? title,
    String? thumbnail,
    int? courseFee,
    int? totalPrice,
    ValidityModel? validity,
    String? type,
  }) =>
      PopularCourseModel(
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        thumbnail: thumbnail ?? this.thumbnail,
        courseFee: courseFee ?? this.courseFee,
        totalPrice: totalPrice ?? this.totalPrice,
        validity: validity ?? this.validity,
      );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'title': title,
    'thumbnail': thumbnail,
    'courseFee': courseFee,
    'totalPrice': totalPrice,
    'type':type,
    'validity': validity.toJson(),
  };
}
