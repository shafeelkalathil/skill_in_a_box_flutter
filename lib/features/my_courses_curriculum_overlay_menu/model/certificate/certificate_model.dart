
import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate_model.g.dart';
@JsonSerializable()
class CertificateModel {
  @JsonKey(name:'_id')
  String? id;
  bool? isCertified;
  List<Certificate>? certificates;

  CertificateModel({
    this.id,
    this.isCertified,
    this.certificates,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) =>
      _$CertificateModelFromJson(json);

  CertificateModel copyWith({
    String? id,
    bool? isCertified,
    List<Certificate>? certificates,
  }) =>
      CertificateModel(
        id: id ?? this.id,
        isCertified: isCertified ?? this.isCertified,
        certificates: certificates ?? this.certificates,
      );

  Map<String, dynamic> toJson() => _$CertificateModelToJson(this);
}

@JsonSerializable()
class Certificate {
  String? name;
  int? size;
  String? type;
  String? link;
  String? certificateId;
  DateTime? date;
  @JsonKey(name:'_id')
  String? id;

  Certificate({
    this.name,
    this.size,
    this.type,
    this.link,
    this.certificateId,
    this.date,
    this.id,
  });

  Certificate copyWith({
    String? name,
    int? size,
    String? type,
    String? link,
    String? certificateId,
    DateTime? date,
    String? id,
  }) =>
      Certificate(
        name: name ?? this.name,
        size: size ?? this.size,
        type: type ?? this.type,
        link: link ?? this.link,
        certificateId: certificateId ?? this.certificateId,
        date: date ?? this.date,
        id: id ?? this.id,
      );

  factory Certificate.fromJson(Map<String, dynamic> json) => _$CertificateFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateToJson(this);
}
