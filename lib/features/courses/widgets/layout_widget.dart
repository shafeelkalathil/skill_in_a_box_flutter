import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course/course_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/course_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';

class LayoutWidget extends ConsumerWidget {
  const LayoutWidget({
    required this.courses,
    super.key,
  });

  final List<Course> courses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomGridView(
          childAspectRatio: context.screenWidth >= 600
              ? 0.4 + context.screenWidth * 0.001
              : 0.1 + context.screenWidth * 0.00125,
          itemLength: courses.length,
          itemBuilder: (context, index) {
            final courseDetails = courses[index];
            return CourseCard(
              id: courseDetails.id!,
              courseType: courseDetails.type,
              imageUrl:
                  courseDetails.thumbnail ?? AppHelpers.defaultNetworkImage,
              courseTitle: courseDetails.title ?? 'title',
              lectureCount: '68',
              coursePeriod: courseDetails.duration ?? 'Duration',
              finalPrice:
                  '₹${(courseDetails.courseFee ?? 0) - (courseDetails.discount ?? 0)}',
              originalPrice: '₹${courseDetails.courseFee}',
            );
          },
        );
      },
    );
  }
}
