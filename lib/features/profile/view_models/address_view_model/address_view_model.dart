import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/address_model/address_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/update_address_model/update_address_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/repositories/address_repository.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/address_view_model/address_states.dart';

final addressViewModelNotifier =
    StateNotifierProvider<AddressViewModel, AddressStates>(
  (ref) => AddressViewModel(ref.read(addressRepositoryProvider)),
);

StateProvider<bool> isPermanentAddressEditCheck = StateProvider((ref) => false);
StateProvider<bool> isShipmentAddressEditCheck = StateProvider((ref) => false);

class AddressViewModel extends StateNotifier<AddressStates> {
  AddressViewModel(this.addressRepository) : super(AddressInitial());

  final AddressRepository addressRepository;

  Future<void> fetchAddressDetails() async {
    if (state.addressModel == null) {
      state = AddressLoading();
      final result = await addressRepository.getAddressDetails();
      result.fold(
        (errorMessage) {
          state = AddressFailed(
            userAddressModel: state.addressModel,
            errorMessage: errorMessage,
          );
        },
        (addressModel) {
          state = AddressSuccess(userAddressModel: addressModel);
        },
      );
    } else {
      state = AddressSuccess(userAddressModel: state.addressModel);
    }
  }

  Future<void> updateAddressDetails(
    AddressModel? currentAddressModel,
    WidgetRef ref, {
    bool isPermanent = true,
  }) async {
    state = AddressLoading(userAddressModel: currentAddressModel);
    final updatedAddressModel = UpdateAddressModel(
      id: isPermanent
          ? currentAddressModel?.permanentAddress?.id
          : currentAddressModel?.shippingAddress?[0].id,
      address: isPermanent
          ? currentAddressModel?.permanentAddress?.address
          : currentAddressModel?.shippingAddress?[0].address,
      country: isPermanent
          ? currentAddressModel?.permanentAddress?.country
          : currentAddressModel?.shippingAddress?[0].country,
      pinCode: isPermanent
          ? currentAddressModel?.permanentAddress?.pinCode
          : currentAddressModel?.shippingAddress?[0].pinCode,
      city: isPermanent
          ? currentAddressModel?.permanentAddress?.city
          : currentAddressModel?.shippingAddress?[0].city,
      state: isPermanent
          ? currentAddressModel?.permanentAddress?.state
          : currentAddressModel?.shippingAddress?[0].state,
      addressId: isPermanent
          ? currentAddressModel?.permanentAddress?.id
          : currentAddressModel?.shippingAddress?[0].id,
      type: isPermanent ? 'permanent' : 'shipping',
    );
    final result =
        await addressRepository.updateAddressDetails(updatedAddressModel);
    result.fold(
      (errorMessage) {
        state = AddressFailed(
          userAddressModel: state.addressModel,
          errorMessage: errorMessage,
        );
      },
      (addressModel) {
        ref.read(isPermanentAddressEditCheck.notifier).state = false;
        ref.read(isShipmentAddressEditCheck.notifier).state = false;
        state = AddressSuccess(userAddressModel: addressModel);
      },
    );
  }
}
