import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/repositories/payment_details_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/payment_details_view_model/paymet_details_state.dart';

final paymentDetailsViewModelNotifier =
StateNotifierProvider<PaymentDetailsViewModel, PaymentDetailsState>(
      (ref) => PaymentDetailsViewModel(
          ref.read(paymentDetailsRepositoriesProvider),),
);


class PaymentDetailsViewModel extends StateNotifier<PaymentDetailsState> {
  PaymentDetailsViewModel(this.paymentDetailsRepositories)
      : super(PaymentDetailsInitial());

  final PaymentDetailsRepositories paymentDetailsRepositories;

  Future<void> getPaymentDetails({required String courseId}) async {
    state = PaymentDetailsLoading();
    final result = await paymentDetailsRepositories
        .getPaymentDetails(courseId: courseId,);
    result.fold((errorMessage) {
      state = PaymentDetailsFailure(errorMessage,);
    },(paymentDetailsModel) {
      state = PaymentDetailsSuccess(paymentDetailsModel);
    },
    );
  }

}
