import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_response_model.g.dart';

@JsonSerializable()
class UploadResponseModel {
  UploadResponseModel({this.status, this.message, this.url});

  factory UploadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseModelFromJson(json);

  final bool? status;
  final String? message;
  final String? url;

  Map<String, dynamic> toJson() => _$UploadResponseModelToJson(this);
}
