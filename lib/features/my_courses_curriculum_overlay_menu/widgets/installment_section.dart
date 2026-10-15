import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/status_badge.dart';

class InstallmentSection extends StatelessWidget {

  const InstallmentSection({
    required this.title,
    required this.amount,
    required this.status,
    required this.bgColor,
    required this.textColor,
    required this.isSelected, super.key,
    this.dueDate, this.onTap,
  });
  final String title;
  final String amount;
  final bool status;
  final Color bgColor;
  final Color textColor;
  final String? dueDate;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return GestureDetector(
      onTap: status  ? null : onTap,
      child: RoundedContainer(
        borderColor: dark
            ? (isSelected ? orange.shade500 : Colors.transparent)
            : (isSelected ? orange.shade500 :const Color(0xffE7E7E7)),
        darkModeBorderColor: dark
            ? (isSelected ? orange.shade500 : Colors.transparent)
            : (isSelected ? orange.shade500 :const Color(0xffE7E7E7)),
        widget: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: subtitle3.copyWith(
                      fontWeight: FontWeight.w700,
                      color: dark
                          ? const Color(0xffD3D3D3):silverChalice.shade700,
                    ),
                  ),
                ),
                StatusBadge(
                  bgColor: bgColor,
                  color: textColor,
                  value: status ? 'paid' : 'unpaid',
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Amount', style: subtitle3.copyWith(
                    color: dark
                        ? const Color(0xffD3D3D3):silverChalice.shade700,),),
                Text(amount, style: subtitle3.copyWith(
                    color: dark
                        ? const Color(0xffD3D3D3):silverChalice.shade700,),),
              ],
            ),
            if (dueDate != null) ...[
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Due Date', style: subtitle3.copyWith(
                      color: dark
                          ? const Color(0xffD3D3D3):silverChalice.shade700,),),
                  Text(dueDate!, style: subtitle3.copyWith(
                      color: dark
                          ? const Color(0xffD3D3D3):silverChalice.shade700,),),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
