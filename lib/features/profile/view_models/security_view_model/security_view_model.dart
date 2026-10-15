import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/security_model/password_reset_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/repositories/security_repository.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/security_view_model/security_states.dart';

final securityViewModelNotifier =
    StateNotifierProvider<SecurityViewModel, SecurityState>(
  (ref) => SecurityViewModel(ref.read(securityRepositoryProvider)),
);

class SecurityViewModel extends StateNotifier<SecurityState> {
  SecurityViewModel(this.securityRepository) : super(SecurityInitial());

  final SecurityRepository securityRepository;

  Future<void> updatePassword(PassWordResetModel updatedPassword) async {
    state = SecurityLoading();
    final response = await securityRepository.resetPassword(updatedPassword);
    response.fold((errorMessage) {
      state = SecurityFailed(errorMessage: errorMessage);
    }, (isChanged) {
      state = SecuritySuccess();
    });
  }
}
