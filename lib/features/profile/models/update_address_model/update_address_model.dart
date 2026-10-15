import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_address_model.g.dart';

@JsonSerializable()
class UpdateAddressModel {
  UpdateAddressModel({
    this.id,
    this.address,
    this.country,
    this.pinCode,
    this.city,
    this.state,
    this.addressId,
    this.type,
  });

  @JsonKey(name: '_id')
  String? id;
  String? address;
  String? country;
  String? pinCode;
  String? city;
  String? state;
  String? addressId;
  String? type;

  Map<String, dynamic> toJson() => _$UpdateAddressModelToJson(this);
}
