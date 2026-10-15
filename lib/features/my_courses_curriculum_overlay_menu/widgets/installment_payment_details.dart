import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/payment_details_model/payment_details_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/widgets/installment_section.dart';


class InstallmentPaymentDetails extends StatelessWidget {
  const InstallmentPaymentDetails({
    required this.installmentData,
    required this.selectedUnpaidIndex,
    super.key,
    this.onTap,
  });

  final List<Installment> installmentData;
  final int? selectedUnpaidIndex;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: installmentData.length,
          itemBuilder: (context, index) {

            final item = installmentData[index];
            final isUnpaid = item.isPaid;

            return Column(
              children: [
                InstallmentSection(
                  title: item.name,
                  amount: item.amount.toString(),
                  status: item.isPaid,
                  bgColor: isUnpaid ? Colors.greenAccent : orange.shade200,
                  textColor: isUnpaid ? Colors.green : orange.shade500,
                  dueDate: '-',
                  isSelected: selectedUnpaidIndex == index,
                  onTap: isUnpaid ? null : () => onTap?.call(index),
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ],
    );
  }
}
