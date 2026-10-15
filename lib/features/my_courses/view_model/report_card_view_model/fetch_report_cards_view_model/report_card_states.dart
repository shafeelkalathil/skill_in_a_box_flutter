import 'package:skill_in_a_box_flutter/features/my_courses/model/report_card_model/report_card_list_model/report_card_model.dart';

abstract class ReportCardStates {}

class ReportCardInitial implements ReportCardStates {}

class ReportCardLoading implements ReportCardStates {}


class ReportCardSuccess implements ReportCardStates {
  ReportCardSuccess({required this.reportCardModel});

  final ReportCardModel reportCardModel;
}

class ReportCardFailed implements ReportCardStates {
  ReportCardFailed({required this.errorMessage});

  final String errorMessage;
}
