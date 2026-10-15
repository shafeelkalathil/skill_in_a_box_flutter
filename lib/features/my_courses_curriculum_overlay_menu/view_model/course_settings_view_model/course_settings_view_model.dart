import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/repositories/course_settings_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/course_settings_view_model/course_settings_state.dart';

final courseSettingsViewModelNotifier =
StateNotifierProvider<CourseSettingsViewModel, CourseSettingsState>(
      (ref) => CourseSettingsViewModel(
          ref.read(courseSettingsRepositoriesProvider),),
);


class CourseSettingsViewModel extends StateNotifier<CourseSettingsState> {
  CourseSettingsViewModel(this.courseSettingsRepositories)
      : super(CourseSettingsInitial());

  final CourseSettingsRepositories courseSettingsRepositories;

  Future<void> getExtendValidity(
      {required String courseId,}) async {
    state = CourseExtendDataLoading();
    final result = await courseSettingsRepositories
        .getExtendValidity(courseId: courseId);
    result.fold((errorMessage) {
      state = CourseExtendDataFailure(errorMessage,);
    },(courseExtendDataModel) {
      state = CourseExtendDataSuccess(courseExtendDataModel);
    },
    );
  }

  Future<void> courseExtendValidity(
      {required String courseId,required String extendPeriod,}) async {
    state = CourseSettingsLoading();
    final result = await courseSettingsRepositories
        .courseExtendValidity(courseId: courseId,extendPeriod: extendPeriod);
    result.fold((errorMessage) {
      state = CourseSettingsFailure(errorMessage,);
    },(courseExtendValidityModel) {
      state = CourseSettingsSuccess(courseExtendValidityModel);
    },
    );
  }

}
