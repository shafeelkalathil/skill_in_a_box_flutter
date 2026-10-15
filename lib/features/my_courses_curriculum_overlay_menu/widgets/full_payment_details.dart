import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/widgets/installment_section.dart';

import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/payment_details_model/payment_details_model.dart';

class FullPaymentDetails extends StatelessWidget {
  const FullPaymentDetails({required this.data,super.key});
  final Payment data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InstallmentSection(
          isSelected: false,
          title: 'Registration Fee',
          status: true,
          amount: '₹ ${data.registrationAmount ?? 0}',
          bgColor: Colors.greenAccent,
          textColor: Colors.green,
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}
