abstract class AssignmentResubmissionStates {}

class AssignmentResubmissionInitial implements AssignmentResubmissionStates {}

class AssignmentResubmissionLoading implements AssignmentResubmissionStates {}

class AssignmentResubmissionRequested implements AssignmentResubmissionStates {}

class AssignmentResubmissionSuccess implements AssignmentResubmissionStates {
  AssignmentResubmissionSuccess();

  // final AssignmentResubmissionModel AssignmentResubmissionModel;
}

class AssignmentResubmissionFailed implements AssignmentResubmissionStates {
  AssignmentResubmissionFailed({required this.errorMessage});

  final String errorMessage;
}
