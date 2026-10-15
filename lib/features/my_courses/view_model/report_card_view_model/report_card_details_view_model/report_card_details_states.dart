import 'package:skill_in_a_box_flutter/features/my_courses/model/report_card_model/report_card_details/report_card_details_model.dart';

abstract class ReportCardDetailsStates {}

class ReportCardDetailsInitial implements ReportCardDetailsStates {}

class ReportCardDetailsLoading implements ReportCardDetailsStates {}


class ReportCardDetailsSuccess implements ReportCardDetailsStates {
  ReportCardDetailsSuccess({required this.reportCardDetailsModel});

  final ReportCardDetailsModel reportCardDetailsModel;
}

class ReportCardDetailsFailed implements ReportCardDetailsStates {
  ReportCardDetailsFailed({required this.errorMessage});

  final String errorMessage;
}
