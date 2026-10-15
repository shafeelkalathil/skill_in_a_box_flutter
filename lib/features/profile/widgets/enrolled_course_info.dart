import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/string_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/status_badge.dart';

class EnrolledCourseInfo extends StatelessWidget {
  const EnrolledCourseInfo({
    required this.title,
    required this.value,
    this.showStatus = false,
    super.key,
  });

  final String title;
  final String value;
  final bool showStatus;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.06,
        vertical: context.screenHeight * 0.015,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: heading3.copyWith(color: dark
                ? const Color(0xffD3D3D3):silverChalice.shade700,),
          ),
          if (showStatus)
            StatusBadge(
              bgColor: getColor(value).withOpacity(0.1),
              color: getColor(value),
              value: getBadgeName(value),
            )
          else
            Text(
              value,
              style: heading3.copyWith(color: dark
                  ? const Color(0xffD3D3D3) : silverChalice.shade700,),
            ),
        ],
      ),
    );
  }

  Color getColor(String value) {
    final greenColorList = [
      'registered',
      'purchased',
      'active',
      'completed',
      'certified',
      'onGoing',
    ];
    if (greenColorList.contains(value)) {
      return forestGreen;
    } else {
      return red;
    }
  }

  String getBadgeName(String value) {
    if (value == 'loanPending') {
      return 'Load Pending';
    } else if (value == 'inActive') {
      return 'In Active';
    } else if (value == 'onGoing') {
      return 'On Going';
    } else {
      return value.capitalize();
    }
  }
}
