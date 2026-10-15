import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/phone_number.dart';

final phoneNumberProvider =
    StateNotifierProvider<PhoneNumberViewModel, PhoneNumber?>(
  (ref) => PhoneNumberViewModel(),
);

class PhoneNumberViewModel extends StateNotifier<PhoneNumber?> {
  PhoneNumberViewModel() : super(null);

  // ignore: use_setters_to_change_properties
  void updatePhoneNumber(PhoneNumber phoneNumber) {
   state = phoneNumber;
  }
}
