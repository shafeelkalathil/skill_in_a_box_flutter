import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/payment_details_view_model/payment_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/payment_details_view_model/paymet_details_state.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/payment_details_model/payment_details_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/widgets/full_payment_details.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/widgets/installment_payment_details.dart';

@RoutePage()
class PaymentDetailScreen extends ConsumerStatefulWidget {
  const PaymentDetailScreen({required this.courseId,super.key});
  final String courseId;

  @override
  ConsumerState<PaymentDetailScreen> createState() =>
      _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends ConsumerState<PaymentDetailScreen> {

  Installment? installmentData;
  int? selectedUnPaidIndex;

  @override
  void initState() {
    super.initState();
    // fetchInstallmentData();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(paymentDetailsViewModelNotifier.notifier)
          .getPaymentDetails(courseId: widget.courseId);
    });
  }

  void selectInstallment(int index,Installment data) {
    setState(() {
      selectedUnPaidIndex = index;
      installmentData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final paymentDetailsState = ref.watch(paymentDetailsViewModelNotifier);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Payment Details'),
      body: paymentDetailsState is PaymentDetailsLoading
          ? const Center(child: CircularProgressIndicator(),)
          : paymentDetailsState is PaymentDetailsFailure
          ? Center(child: Text(paymentDetailsState.message),)
          : paymentDetailsState is PaymentDetailsSuccess
          ? SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child:SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: paymentDetailsState
                    .paymentDetailsModel.payment.length,
                itemBuilder: (context, index) {
                  final data = paymentDetailsState
                      .paymentDetailsModel.payment[index];
                  /// full payment
                  return data.type == 'fullpayment'
                      ? FullPaymentDetails(data: data,)
                      : data.type == 'installment'
                  ///installment payment
                      ?InstallmentPaymentDetails(
                    installmentData: data.installments!.installments,
                    onTap: (index) => selectInstallment(index,
                        data.installments!.installments[index],),
                    selectedUnpaidIndex: selectedUnPaidIndex,
                  )
                  /// default
                      :const SizedBox();
                  /// emi payment
                  // EmiPaymentDetails();
                },),
          ),
        ),
      )
          : const SizedBox.shrink() ,
      bottomNavigationBar: installmentData != null
          ? Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.06),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              installmentData!.amount.toString(),
              style: heading2.copyWith(
                fontWeight: FontWeight.w600,
                color: orange.shade500,
              ),
            ),
            SizedBox(
              width: context.screenWidth * 0.4,
              height: 44,
              child: ElevatedButton(
                onPressed: () {
                  // Add payment logic here
                },
                child: const Center(
                  child: Text('Pay Now'),
                ),
              ),
            ),
          ],
        ),
      )
          : const SizedBox(),
    );
  }
}
