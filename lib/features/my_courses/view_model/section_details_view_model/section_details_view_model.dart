import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/curriculum_model_extension.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/section_model/section_ui_model/section_ui_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/section_details_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/curriculum_view_model/curriculum_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/curriculum_view_model/curriculum_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/section_details_view_model/section_details_state.dart';

final sectionDetailsViewModelProvider = StateNotifierProvider.family<
    SectionDetailsViewModel, SectionDetailsStates, String>(
  (ref, sectionId) =>
      SectionDetailsViewModel(ref.watch(sectionDetailsRepositoryProvider)),
);

class SectionDetailsViewModel extends StateNotifier<SectionDetailsStates> {
  SectionDetailsViewModel(this.sectionDetailsRepository)
      : super(
          SectionDetailsInitial(),
        );

  final SectionDetailsRepositories sectionDetailsRepository;

  Future<void> fetchSectionDetails({
    required String courseId,
    required String sectionId,
    required WidgetRef ref,
  }) async {
    final curriculumState = ref.watch(curriculumViewModelProvider(courseId));
    if (curriculumState is CurriculumSuccess) {
      final canAccessSection =
          curriculumState.curriculumModel.canAccessSection(sectionId);
      state = SectionDetailsLoading();
      final response = await sectionDetailsRepository.getSectionDetails(
        courseId: courseId,
        sectionId: sectionId,
      );
      await response.fold((errorMessage) {
        state = SectionDetailsFailed(errorMessage: errorMessage);
      }, (sectionModel) async {
        final contentOrderList = sectionModel.orderArray;
        final uiModelList = <SectionUiModel>[];
        if (contentOrderList != null) {
          var previousUnlocked = false;
          for (final content in contentOrderList) {
            final isCurrentLesson = (sectionModel.currentLesson == content.id);
            final isLocked = previousUnlocked || !canAccessSection;

            //type : lesson
            if (content.type == SectionType.lesson.name) {
              final lessonResponse =
                  await sectionDetailsRepository.getLessonDetails(
                courseId: courseId,
                sectionId: sectionId,
                lessonId: content.id!,
              );
              lessonResponse.fold((errorMessage) {
                state = SectionDetailsFailed(errorMessage: errorMessage);
                return;
              }, (lessonModel) {
                final uiModel = SectionUiModel(
                  type: lessonModel.lessonData?.type ?? 'pdf',
                  id: content.id!,
                  title: lessonModel.lessonData?.contents?.english?.title ??
                      'Title',
                  isLocked: isLocked,
                );
                uiModelList.add(uiModel);
              });
            }

            //type : quiz

            else if (content.type == SectionType.quiz.name) {
              final quizResponse = await sectionDetailsRepository.getQuizStatus(
                courseId: courseId,
                sectionId: sectionId,
                quizId: content.id!,
              );
              quizResponse.fold((errorMessage) {
                state = SectionDetailsFailed(errorMessage: errorMessage);
                return;
              }, (quizStatusModel) {
                final uiModel = SectionUiModel(
                  type: 'quiz',
                  id: content.id!,
                  title: quizStatusModel.quizData?.name ?? 'Title',
                  isLocked: isLocked,
                );
                uiModelList.add(uiModel);
              });
            }

            //type : assignments

            else if (content.type == SectionType.assignments.name) {
              final uiModel = SectionUiModel(
                type: content.type!,
                id: content.id!,
                title: 'Assignment',
                isLocked: isLocked,
              );
              uiModelList.add(uiModel);
            }
            if (isCurrentLesson) {
              previousUnlocked = true;
            }
          }
        }
        state = SectionDetailsSuccess(
          sectionUiModel: uiModelList,
          currentLesson: sectionModel.currentLesson!,
        );
      });
    }
  }
}
