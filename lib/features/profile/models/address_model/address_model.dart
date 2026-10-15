import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  AddressModel({this.permanentAddress, this.shippingAddress});

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Address? permanentAddress;
  List<Address>? shippingAddress;

  AddressModel copyWith({
    Address? permanentAddress,
    List<Address>? shippingAddress,
  }) {
    return AddressModel(
      permanentAddress: permanentAddress ?? this.permanentAddress,
      shippingAddress: shippingAddress ?? this.shippingAddress,
    );
  }

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}

@JsonSerializable()
class Address {
  Address({
    this.id,
    this.address,
    this.country,
    this.pinCode,
    this.city,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  String? address;
  String? country;
  String? pinCode;
  String? city;
  String? state;


  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
