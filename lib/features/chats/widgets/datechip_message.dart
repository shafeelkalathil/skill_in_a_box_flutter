import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class DateChipMessage extends StatelessWidget {
  const DateChipMessage({required this.date, super.key});
  final String date;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: dark ? const Color(0xffD3D3D3) :silverChalice.shade500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            date,
            style: body1.copyWith(color: dark
                ? const Color(0xffD3D3D3):silverChalice.shade900,),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color:  dark ? const Color(0xffD3D3D3) :silverChalice.shade500,
          ),
        ),
      ],
    );
  }
}
