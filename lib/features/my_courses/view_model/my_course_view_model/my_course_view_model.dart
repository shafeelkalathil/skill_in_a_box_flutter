import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/my_course_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_course_view_model/my_course_state.dart';

final myCourseViewModelProvider =
    StateNotifierProvider<MyCourseViewModel, MyCourseState>(
  (ref) => MyCourseViewModel(
    myCourseRepository: ref.read(myCourseRepositoryProvider),
  ),
);


class MyCourseViewModel extends StateNotifier<MyCourseState> {
  MyCourseViewModel({required this.myCourseRepository})
      : super(MyCourseInitial());
  final MyCourseRepository myCourseRepository;

  Future<void> fetchMyCourses({bool isRefreshing = false}) async {
    if (isRefreshing || state.myCourseList == null) {
      state = MyCourseLoading(listOfMyCourses: state.myCourseList);
    }
    final response = await myCourseRepository.fetchAllMyCourses();
    response.fold((errorMessage) {
      state =
          MyCourseFailure(errorMessage, listOfMyCourses: state.myCourseList);
    }, (responsData) {
      state = MyCourseSuccess(listOfMyCourses: responsData);
    });
  }

}
