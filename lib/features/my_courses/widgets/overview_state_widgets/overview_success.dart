import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course_overview/course_overview_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/widgets/overview_section.dart';

class OverviewSuccessWidget extends StatelessWidget {
  const OverviewSuccessWidget({required this.courseOverviewData, super.key});
  final CourseOverviewModel courseOverviewData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
          OverviewSection(courseOverviewData: courseOverviewData),
        ],
      ),
    );
  }
}
