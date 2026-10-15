import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class ProgressReportCard extends StatelessWidget {
  const ProgressReportCard({required this.date,super.key});
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.screenWidth * 0.03),
      decoration: BoxDecoration(
        color: const Color(0Xffffffff),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 0.8, color: const Color(0xffe7e7e7)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.images.progressReportCard.path),
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
          Text(
            'Progress Report',
            style: subtitle3.copyWith(color: silverChalice.shade800),
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.calendar,
                width: 20,
                colorFilter: ColorFilter.mode(orange, BlendMode.srcIn),
              ),
              SizedBox(
                width: context.screenWidth * 0.01,
              ),
              Text(
                DateFormat('MMM dd,y').format(DateTime.parse(date)),
                style: subtitle3.copyWith(color: silverChalice.shade400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
