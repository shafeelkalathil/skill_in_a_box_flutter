import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/assignment/models/assignment_model/assignment_model.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/pdf_widget.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/expandable_text.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class AssignmentDetails extends StatelessWidget {
  const AssignmentDetails({
    required this.isGraded,
    required this.question,
    required this.mark,
    required this.dueDays,
    required this.attachments,
    super.key,
  });
  final bool isGraded;
  final String question;
  final String mark;
  final String dueDays;
  final List<Attachments> attachments;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return RoundedContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.icons.clipboard),
                  SizedBox(
                    width: context.screenHeight * 0.02,
                  ),
                  Text(
                    'Assignment Details',
                    style: subtitle3.copyWith(color: orange),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: isGraded
                      ? const Color(0xff39C261).withOpacity(0.15)
                      : const Color(0xffff4343).withOpacity(0.15),
                ),
                child: Text(
                  isGraded ? 'Graded' : 'Not Graded',
                  style: heading4.copyWith(
                    color: isGraded
                        ? const Color(0xff39C261)
                        : const Color(0xffff4343),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
          ExpandableText(text: question),
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
          if (attachments.isEmpty)
            const SizedBox.shrink()
          else
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PdfWidget(
                  title: attachments[index].name ?? 'title',
                  link: attachments[index].link!,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: context.screenHeight * 0.015,
                );
              },
              itemCount: attachments.length,
            ),
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    Assets.images.calenderImage.path,
                    width: 24,
                  ),
                  SizedBox(
                    width: context.screenWidth * 0.02,
                  ),
                  Text(
                    lastDate(),
                    style: subtitle2.copyWith(
                      color: dark
                          ? const Color(0xffD3D3D3):silverChalice.shade700,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.trophy,
                    width: 20,
                  ),
                  SizedBox(
                    width: context.screenWidth * 0.02,
                  ),
                  Text(
                    '$mark Marks',
                    style: subtitle2.copyWith(
                      color: dark
                          ? const Color(0xffD3D3D3):silverChalice.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String lastDate() {
    final now = DateTime.now();
    final remainingDays = int.parse(dueDays);
    return DateFormat('MMMM dd, y')
        .format(now.add(Duration(days: remainingDays)));
  }
}
