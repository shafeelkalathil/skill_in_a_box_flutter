import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/section_details_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/lesson_view_model/lesson_progress_view_model/lesson_progress_state.dart';

final lessonProgressViewModelProvider =
StateNotifierProvider<LessonProgressViewModel, LessonProgressState>(
      (ref) => LessonProgressViewModel(ref.watch(sectionDetailsRepositoryProvider)),);

class LessonProgressViewModel extends StateNotifier<LessonProgressState> {
  LessonProgressViewModel(this.sectionDetailsRepository)
      : super(LessonProgressStateInitial(),);

  final SectionDetailsRepositories sectionDetailsRepository;

  Future<void> updateLessonProgress({
    required String courseId,
    required String sectionId,
    required String lessonId,
    required double currentProgress,
    required bool isFinished,
  }) async {

    state = LessonProgressStateLoading();
    final result = await sectionDetailsRepository
        .updateLessonProgress(
        courseId: courseId,
        sectionId: sectionId,
        lessonId: lessonId,
      currentProgress: currentProgress,
      isFinished: isFinished
    );

    result.fold((errorMessage) {
      state = LessonProgressStateFailure(errorMessage);
    }, (finalExamStatusModel) {
      state = LessonProgressStateSuccess(finalExamStatusModel);
    },
    );
  }

}
