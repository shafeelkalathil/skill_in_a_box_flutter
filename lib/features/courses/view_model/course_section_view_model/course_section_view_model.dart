import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/features/courses/repositories/course_repositorie.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/section_model/section_ui_model/section_ui_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/section_details_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/section_details_view_model/section_details_state.dart';

final courseSectionViewModelProvider = StateNotifierProvider.family<
    CourseSectionViewModel, SectionDetailsStates, String>(
  (ref, sectionId) => CourseSectionViewModel(
    ref.watch(courseRepositoryProvider),
    ref.watch(sectionDetailsRepositoryProvider),
  ),
);

class CourseSectionViewModel extends StateNotifier<SectionDetailsStates> {
  CourseSectionViewModel(this.courseRepository, this.sectionDetailsRepository)
      : super(
          SectionDetailsInitial(),
        );

  final CourseRepository courseRepository;
  final SectionDetailsRepositories sectionDetailsRepository;
  Future<void> fetchCourseSection({
    required String courseId,
    required String sectionId,
  }) async {
    state = SectionDetailsLoading();
    final response = await courseRepository.getCourseSection(
      courseId: courseId,
      sectionId: sectionId,
    );
    await response.fold((errorMessage) {
      state = SectionDetailsFailed(errorMessage: errorMessage);
    }, (courseSectionModel) async {
      final contentOrderList = courseSectionModel.orderArray;
      final uiModelList = <SectionUiModel>[];
      if (contentOrderList != null) {
        for (final content in contentOrderList) {
          //type : lesson
          if (content.type == SectionType.lesson.name) {
            final lesson = courseSectionModel.lessonArray!.firstWhere(
              (lesson) => lesson.id == content.id,
            );
            final uiModel = SectionUiModel(
              type: lesson.type ?? 'pdf',
              id: content.id!,
              title: lesson.title ?? 'Title',
            );
            uiModelList.add(uiModel);
          }

          //type : quiz

          else if (content.type == SectionType.quiz.name) {
            final quiz = courseSectionModel.quizArray!.firstWhere(
              (quiz) => quiz.id == content.id,
            );
            final uiModel = SectionUiModel(
              type: 'quiz',
              id: content.id!,
              title: quiz.title ?? 'Title',
            );
            uiModelList.add(uiModel);
          }

          //type : assignments

          else if (content.type == SectionType.assignments.name) {
            final uiModel = SectionUiModel(
              type: content.type!,
              id: content.id!,
              title: 'Assignment',
            );
            uiModelList.add(uiModel);
          }
        }
      }
      print(uiModelList);
      state = SectionDetailsSuccess(
        sectionUiModel: uiModelList,
        currentLesson: '',
      );
    });
  }
}
