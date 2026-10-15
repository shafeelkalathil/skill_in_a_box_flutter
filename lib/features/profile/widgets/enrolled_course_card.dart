import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/enrolled_courses_model/enrolled_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/enrolled_courses_view_model/enrolled_courses_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/enrolled_courses_view_model/enrolled_coursess_state.dart';
import 'package:skill_in_a_box_flutter/features/profile/widgets/enrolled_course_info.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

class EnrolledCourseCard extends ConsumerWidget {
  const EnrolledCourseCard({
    required this.course,
    super.key,
  });
  final Course? course;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(enrolledCoursesViewModelProvider);
    final dark =  AppHelpers.isDarkMode(context);
    if (state is EnrolledCoursesLoading) {
      return ShimmerCard(
        width: context.screenWidth,
        height: context.screenHeight * 0.3,
        borderRadius: 16,
      );
    } else {
      return RoundedContainer(
        isPadding: false,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: context.screenWidth * 0.06,
                right: context.screenWidth * 0.06,
                top: context.screenHeight * 0.02,
                bottom: context.screenHeight * 0.015,
              ),
              child: Text(
                course?.courseDetails?.title ?? '_',
                style: heading3.copyWith(color: dark
                    ? Colors.white : silverChalice.shade900,),
              ),
            ),
            if(!dark)const Divider(color: Color(0xffE7E7E7)),
            EnrolledCourseInfo(
              title: 'Progress',
              value: '${course?.progress ?? '_'}%',
            ),
            EnrolledCourseInfo(
                title: 'Batch',
                value: course?.batchDetails?.batchId ?? '_',),
            const EnrolledCourseInfo(title: 'Validity', value: '07-02-2023'),
            EnrolledCourseInfo(
              title: 'Enrollment Status',
              value: course?.status??'_',
              showStatus: true,
            ),
          ],
        ),
      );
    }
  }
}
