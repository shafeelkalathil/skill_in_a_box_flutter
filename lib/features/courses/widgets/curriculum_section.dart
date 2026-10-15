import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course_curriculum/course_curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/view_model/course_view_model/course_state.dart';
import 'package:skill_in_a_box_flutter/features/courses/view_model/course_view_model/course_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/expansion_tile.dart';

class CurriculumSection extends ConsumerStatefulWidget {
  const CurriculumSection({required this.courseId, super.key});
  final String courseId;

  @override
  ConsumerState<CurriculumSection> createState() => _CurriculumSectionState();
}

class _CurriculumSectionState extends ConsumerState<CurriculumSection> {
  late CourseCurriculumModel courseCurriculumData;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchCourseCurriculum();
  }

  Future<void> _fetchCourseCurriculum() async {
    try {
      courseCurriculumData = await ref
          .read(courseViewModelProvider.notifier)
          .fetchCourseCurriculum(courseId: widget.courseId);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load curriculum: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(courseViewModelProvider);
    final dark = AppHelpers.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Curriculum',
              style: heading3.copyWith(
                color: dark ? Colors.white : silverChalice.shade900,
              ),
            ),
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (errorMessage != null)
              Center(child: Text(errorMessage!))
            else if (state is CourseSuccess)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: courseCurriculumData.sections.length,
                itemBuilder: (context, index) {
                  final section = courseCurriculumData.sections[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      top: context.screenHeight * 0.02,
                      bottom:
                          (index == courseCurriculumData.sections.length - 1)
                              ? context.screenHeight * 0.14
                              : 0,
                    ),
                    child: CustomExpansionTile(
                      courseId: widget.courseId,
                      isCoursePage: true,
                      sectionId: section.id,
                      title: section.title,
                      courseData: Courses(),
                      isDatePassed: false,
                      trailing: const SizedBox.shrink(),
                    ),
                  );
                },
              )
            else if (state is CourseFailure)
              Center(child: Text('Error: ${state.message}'))
            else
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
