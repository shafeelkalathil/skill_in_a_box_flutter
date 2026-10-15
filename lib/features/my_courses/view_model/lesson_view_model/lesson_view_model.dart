import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/section_details_repositories.dart';

import 'package:skill_in_a_box_flutter/features/my_courses/view_model/lesson_view_model/lesson_state.dart';

final lessonViewModelProvider =
    StateNotifierProvider<LessonViewModel, LessonState>(
  (ref) => LessonViewModel(ref.watch(sectionDetailsRepositoryProvider)),
);

class LessonViewModel extends StateNotifier<LessonState> {
  LessonViewModel(this.sectionDetailsRepository)
      : super(
          LessonStateInitial(),
        );

  final SectionDetailsRepositories sectionDetailsRepository;

  Future<void> getLessonDetails({
    required String courseId,
    required String sectionId,
    required String lessonId,
  }) async {
    state = LessonStateLoading();
    final result = await sectionDetailsRepository.getLessonDetails(
      courseId: courseId,
      sectionId: sectionId,
      lessonId: lessonId,
    );

    result.fold(
      (errorMessage) {
        state = LessonStateFailure(errorMessage);
      },
      (finalExamStatusModel) {
        state = LessonStateSuccess(finalExamStatusModel);
      },
    );
  }
}
