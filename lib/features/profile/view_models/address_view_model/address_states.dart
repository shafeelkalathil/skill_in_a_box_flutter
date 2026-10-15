import 'package:skill_in_a_box_flutter/features/profile/models/address_model/address_model.dart';

abstract class AddressStates {
  AddressStates({this.addressModel});
  final AddressModel? addressModel;
}

class AddressInitial implements AddressStates {
  @override
  AddressModel? get addressModel => null;
}

class AddressLoading implements AddressStates {
  AddressLoading({this.userAddressModel});

  final AddressModel? userAddressModel;
  @override
  AddressModel? get addressModel => userAddressModel;
}

class AddressSuccess implements AddressStates {
  AddressSuccess({this.userAddressModel});

  final AddressModel? userAddressModel;
  @override
  AddressModel? get addressModel => userAddressModel;
}

class AddressFailed implements AddressStates {
  AddressFailed({this.userAddressModel, this.errorMessage});

  final AddressModel? userAddressModel;
  final String? errorMessage;
  @override
  AddressModel? get addressModel => userAddressModel;
}
