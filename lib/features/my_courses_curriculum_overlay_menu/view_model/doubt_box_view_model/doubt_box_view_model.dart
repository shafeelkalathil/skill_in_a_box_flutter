import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/repositories/doubt_box_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_section_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_states.dart';

final doubtBoxViewModelProvider =
    StateNotifierProvider.family<DoubtBoxViewModel, DoubtBoxStates, String>(
  (ref, id) => DoubtBoxViewModel(ref.watch(doubtBoxRepositoryProvider)),
);

class DoubtBoxViewModel extends StateNotifier<DoubtBoxStates> {
  DoubtBoxViewModel(this.doubtBoxRepository) : super(DoubtBoxInitial());

  final DoubtBoxRepository doubtBoxRepository;

  Future<void> fetchDoubtBoxSections({
    required String courseId,
  }) async {
    state = DoubtBoxLoading();
    final response = await doubtBoxRepository.getSections(courseId: courseId);
    response.fold((errorMessage) {
      state = DoubtBoxFailed(errorMessage: errorMessage);
    }, (doubtBoxSectionData) {
      state = DoubtBoxSuccess(doubtBoxSectionModel: doubtBoxSectionData);
    });
  }

  Future<void> fetchDoubtBoxSectionDetails({
    required String courseId,
    required String sectionId,
  }) async {
    state = DoubtBoxSectionLoading();
    final response = await doubtBoxRepository.getSectionDetails(
      courseId: courseId,
      sectionId: sectionId,
    );
    response.fold((errorMessage) {
      state = DoubtBoxSectionFailed(errorMessage: errorMessage);
    }, (doubtBoxSectionDetailsData) {
      state = DoubtBoxSectionSuccess(
        doubtBoxSectionDetailsModel: doubtBoxSectionDetailsData,
      );
    });
  }

  Future<void> handlingLike({
    required String courseId,
    required String sectionId,
    required String doubtId,
    required String type,
  }) async {
    final response = await doubtBoxRepository.handlingLike(
      courseId: courseId,
      sectionId: sectionId,
      doubtId: doubtId,
      type: type,
    );
    response.fold((errorMessage) {
      print('error occured $errorMessage');
    }, (isSuccess) {
      print('like is successful');
    });
  }
}
