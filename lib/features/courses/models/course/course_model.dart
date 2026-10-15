import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
 CourseModel({
   this.course,
   this.totalDocuments,
   this.currentPage,
   this.totalPages,
 });

 factory CourseModel.fromJson(Map<String, dynamic> json) => 
     _$CourseModelFromJson(json);

 final List<Course>? course;
 final int? totalDocuments;
 final int? currentPage;
 final int? totalPages;

 Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}

@JsonSerializable()
class Course {
 Course({
   this.id,
   this.thumbnail,
   this.title,
   this.description,
   this.courseFee,
   this.discount,
   this.duration,
   this.categoryDetails,
   this.type,
 });

 factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

 @JsonKey(name: '_id')
 final String? id;
 final String? thumbnail;
 final String? title;
 final String? description;
 final int? courseFee;
 final int? discount;
 final String? duration;
 final CategoryDetails? categoryDetails;
 final String? type;

 Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class CategoryDetails {
 CategoryDetails({
   this.id,
   this.name,
   this.type,
 });

 factory CategoryDetails.fromJson(Map<String, dynamic> json) =>
     _$CategoryDetailsFromJson(json);

 @JsonKey(name: '_id')
 final String? id;
 final String? name;
 final String? type;

 Map<String, dynamic> toJson() => _$CategoryDetailsToJson(this);
}