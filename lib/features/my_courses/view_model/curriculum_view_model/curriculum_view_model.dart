import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/my_course_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/curriculum_view_model/curriculum_states.dart';

final curriculumViewModelProvider =
    StateNotifierProvider.family<CurriculumViewModel, CurriculumStates, String>(
  (ref,courseId) => CurriculumViewModel(ref.watch(myCourseRepositoryProvider)),
);

class CurriculumViewModel extends StateNotifier<CurriculumStates> {
  CurriculumViewModel(this.myCourseRepository) : super(CurriculumInitial());

  final MyCourseRepository myCourseRepository;

  Future<void> fetchCurriculumDetails(
    String courseId, {
    bool isRefreshing = false,
  }) async {
    if (isRefreshing || state.stateCurriculumModel == null) {
      state = CurriculumLoading();
    }
    final response = await myCourseRepository.fetchCurriculum(courseId);
    response.fold((errorMessage) {
      state = CurriculumFailed(errorMessage: errorMessage);
    }, (curriculumData) {
      state = CurriculumSuccess(curriculumModel: curriculumData);
    });
  }
}
