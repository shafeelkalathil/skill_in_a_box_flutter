import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:html/parser.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course_overview/course_overview_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/overview_content.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class OverviewSection extends StatefulWidget {
  const OverviewSection({required this.courseOverviewData, super.key});
  final CourseOverviewModel courseOverviewData;

  @override
  State<OverviewSection> createState() => _OverviewSectionState();
}

class _OverviewSectionState extends State<OverviewSection> {
  late final List<String> courseOutputSubTitleHeading;
  late final List<String> courseOutputSubTitleContent;

  late final List<String> requirementSubTitleHeading;
  late final List<String> requirementSubTitleContent;

  @override
  void initState() {
    super.initState();
    courseOutputSubTitleHeading = _extractHeadings(
        widget.courseOverviewData.courseOutput ?? [],);
    courseOutputSubTitleContent = _extractContents(
        widget.courseOverviewData.courseOutput ?? [],);

    requirementSubTitleHeading = _extractHeadings(
        widget.courseOverviewData.requirement ?? [],);
    requirementSubTitleContent = _extractContents(
        widget.courseOverviewData.requirement ?? [],);
  }

  List<String> _extractHeadings(List<String> data) {
    return data.map((item) {
      final colonIndex = item.indexOf(':');
      return colonIndex != -1
          ? item.substring(0, colonIndex + 1).trim()
          : item.trim();
    }).toList();
  }

  List<String> _extractContents(List<String> data) {
    return data.map((item) {
      final colonIndex = item.indexOf(':');
      return colonIndex != -1
          ? item.substring(colonIndex + 1).trim()
          : '';
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomOverViewContent(
              title: 'Description',
              subTitleContent: [parse(
                  widget.courseOverviewData.description,).body!.text,],
            ),
            const SizedBox(height: 15),
            CustomOverViewContent(
              title: 'What You’ll Get',
              subTitleHeading: courseOutputSubTitleHeading,
              subTitleContent: courseOutputSubTitleContent,
              isShowIcon: true,
              iconWidget: SvgPicture.asset(Assets.icons.tick),
            ),
            const SizedBox(height: 15),
            CustomOverViewContent(
              title: 'Course Requirements',
              subTitleHeading: requirementSubTitleHeading,
              subTitleContent: requirementSubTitleContent,
              isShowIcon: true,
              iconWidget: CircleAvatar(
                radius: 5,
                backgroundColor: orange.shade500,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.17),
          ],
        ),
      ),
    );
  }
}
