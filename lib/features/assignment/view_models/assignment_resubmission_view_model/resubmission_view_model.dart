import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/assignment/repositories/assignment_repository.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_resubmission_view_model/resubmission_states.dart';

final assignmentResubmissionViewModelProvider = StateNotifierProvider.family<
    AssignmentResubmissionViewModel, AssignmentResubmissionStates, String>(
  (ref, lessonId) =>
      AssignmentResubmissionViewModel(ref.watch(assignmentRepositoryProvider)),
);

class AssignmentResubmissionViewModel
    extends StateNotifier<AssignmentResubmissionStates> {
  AssignmentResubmissionViewModel(this.assignmentRepository)
      : super(AssignmentResubmissionInitial());

  final AssignmentRepository assignmentRepository;

  Future<void> requestResubmission({
    required String courseId,
    required String lessonId,
    required String sectionId,
  }) async {
    state = AssignmentResubmissionLoading();
    final response = await assignmentRepository.requestResubmission(
      courseId: courseId,
      lessonId: lessonId,
      sectionId: sectionId,
    );
    response.fold((errorMessage) {
      state = AssignmentResubmissionFailed(errorMessage: errorMessage);
    }, (isSuccess) {
      state = AssignmentResubmissionRequested();
    });
  }
}
