import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/curriculum_model/curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/expansion_tile.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/final_exam_expansion_tile.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class CurriculumDetails extends ConsumerWidget {
  const CurriculumDetails({
    required this.course,
    this.curriculumModel,
    super.key,
  });

  final CurriculumModel? curriculumModel;
  final Courses course;

  bool isDatePassed(String? dateStr) {
    if (dateStr == null) {
      return true;
    } else {
      try {
        var apiDate = DateFormat('dd MMM yyyy').parse(dateStr);
        var currentDate = DateTime.now();

        apiDate = DateTime(apiDate.year, apiDate.month, apiDate.day);
        currentDate = DateTime(
          currentDate.year,
          currentDate.month,
          currentDate.day,
        );

        return currentDate.isAfter(apiDate) || currentDate == apiDate;
      } catch (e) {
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: List.generate(
                curriculumModel?.curriculum?.sections?.length ?? 2, (index) {
              final currentSection =
                  curriculumModel?.curriculum?.sections?[index];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: context.screenHeight * 0.015,
                ),
                child: CustomExpansionTile(
                  courseId: course.courseDetails!.id!,
                  sectionId: currentSection?.id ?? '',
                  title: currentSection?.title ?? 'Title',
                  courseData: course,
                  curriculumModel: curriculumModel,
                  isDatePassed: isDatePassed(currentSection?.openingDate),
                  trailing: isDatePassed(currentSection?.openingDate)
                      ? const SizedBox.shrink()
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              currentSection?.openingDate ?? '',
                              style: heading4.copyWith(
                                color: silverChalice.shade300,
                              ),
                            ),
                            SizedBox(
                              width: context.screenWidth * 0.03,
                            ),
                            SvgPicture.asset(
                              Assets.icons.lock,
                              width: 16,
                            ),
                          ],
                        ),
                ),
              );
            }),
          ),
          if (curriculumModel?.finalExams?.isNotEmpty ?? false)
            Padding(
              padding: EdgeInsets.only(
                bottom: context.screenHeight * 0.015,
              ),
              child: FinalExamExpansionTile(
                courseId: course.courseDetails!.id!,
                curriculumModel: curriculumModel!,
              ),
            ),
        ],
      ),
    );
  }
}
