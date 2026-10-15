
import 'package:freezed_annotation/freezed_annotation.dart';
part 'file_upload_model.g.dart';
@JsonSerializable()
class FileUploadModel {

  FileUploadModel({
    this.status,
    this.message,
    this.url,
  });

  factory FileUploadModel.fromJson(Map<String, dynamic> json) =>
      _$FileUploadModelFromJson(json);
  bool? status;
  String? message;
  String? url;

  FileUploadModel copyWith({
    bool? status,
    String? message,
    String? url,
  }) =>
      FileUploadModel(
        status: status ?? this.status,
        message: message ?? this.message,
        url: url ?? this.url,
      );

  Map<String, dynamic> toJson() => _$FileUploadModelToJson(this);
}
