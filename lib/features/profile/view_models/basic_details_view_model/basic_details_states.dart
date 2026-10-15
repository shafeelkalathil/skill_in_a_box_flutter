part of 'basic_details_view_model.dart';

abstract class BasicDetailsState {
  const BasicDetailsState({this.userDetails});
  final BasicDetailsModel? userDetails;
}

class BasicDetailsInitial implements BasicDetailsState {
  @override
  BasicDetailsModel? get userDetails => null;
}

class BasicDetailsLoading implements BasicDetailsState {
  BasicDetailsLoading({this.detailsOfUser});
  BasicDetailsModel? detailsOfUser;
  @override
  BasicDetailsModel? get userDetails => detailsOfUser;
}

class BasicDetailsSuccess implements BasicDetailsState {
  BasicDetailsSuccess({this.detailsOfUser});
  BasicDetailsModel? detailsOfUser;
  @override
  BasicDetailsModel? get userDetails => detailsOfUser;
}

class BasicDetailsFailed implements BasicDetailsState {
  BasicDetailsFailed({required this.errorMessage, this.detailsOfUser});
  final String errorMessage;
  BasicDetailsModel? detailsOfUser;
  @override
  BasicDetailsModel? get userDetails => detailsOfUser;
}
