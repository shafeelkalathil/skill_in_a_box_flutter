import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/assignment/repositories/assignment_repository.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_view_model/assignment_states.dart';

final assignmentViewModelProvider =
    StateNotifierProvider<AssignmentViewModel, AssignmentStates>(
  (ref) => AssignmentViewModel(ref.watch(assignmentRepositoryProvider)),
);

class AssignmentViewModel extends StateNotifier<AssignmentStates> {
  AssignmentViewModel(this.assignmentRepository) : super(AssignmentInitial());

  final AssignmentRepository assignmentRepository;

  Future<void> fetchAssignment({
    required String courseId,
    required String lessonId,
    required String sectionId,
  }) async {
    print('lessson id : $lessonId');
    print('section id : $sectionId');
    print('course id : $courseId');
    state = AssignmentLoading();
    final response = await assignmentRepository.getAssignment(
      courseId: courseId,
      lessonId: lessonId,
      sectionId: sectionId,
    );
    response.fold((errorMessage) {
      state = AssignmentFailed(errorMessage: errorMessage);
    }, (assignmentData) {
      state = AssignmentSuccess(assignmentModel: assignmentData);
    });
  }
}
