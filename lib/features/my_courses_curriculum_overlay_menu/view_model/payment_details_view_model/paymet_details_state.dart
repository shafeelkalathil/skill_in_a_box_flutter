
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/payment_details_model/payment_details_model.dart';

abstract class PaymentDetailsState {}

class PaymentDetailsInitial extends PaymentDetailsState {}

class PaymentDetailsLoading extends PaymentDetailsState {}

class PaymentDetailsFailure extends PaymentDetailsState {
  PaymentDetailsFailure(this.message);
  final String message;
}

class PaymentDetailsSuccess extends PaymentDetailsState {
  PaymentDetailsSuccess(this.paymentDetailsModel);
  final PaymentDetailsModel paymentDetailsModel;
}
