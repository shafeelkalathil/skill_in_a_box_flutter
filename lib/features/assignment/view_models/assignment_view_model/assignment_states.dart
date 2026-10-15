
import 'package:skill_in_a_box_flutter/features/assignment/models/assignment_model/assignment_model.dart';

abstract class AssignmentStates {}

class AssignmentInitial implements AssignmentStates {}

class AssignmentLoading implements AssignmentStates {}


class AssignmentSuccess implements AssignmentStates {
  AssignmentSuccess({required this.assignmentModel});

  final AssignmentModel assignmentModel;
}

class AssignmentFailed implements AssignmentStates {
  AssignmentFailed({required this.errorMessage});

  final String errorMessage;
}
