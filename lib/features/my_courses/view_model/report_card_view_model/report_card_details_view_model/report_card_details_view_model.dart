import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/my_course_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/report_card_view_model/report_card_details_view_model/report_card_details_states.dart';

final reportCardDetailsViewModelProvider = StateNotifierProvider.family<
    ReportCardDetailsViewModel, ReportCardDetailsStates, String>(
  (ref, id) =>
      ReportCardDetailsViewModel(ref.watch(myCourseRepositoryProvider)),
);

class ReportCardDetailsViewModel
    extends StateNotifier<ReportCardDetailsStates> {
  ReportCardDetailsViewModel(this.myCourseRepository)
      : super(ReportCardDetailsInitial());

  final MyCourseRepository myCourseRepository;

  Future<void> fetchReportCardDetails({
    required String reportCardId,
    required String sectionId,
  }) async {
    state = ReportCardDetailsLoading();
    final response = await myCourseRepository.fetchReportCardDetails(
      reportCardId: reportCardId,
      sectionId: sectionId,
    );
    response.fold((errorMessage) {
      state = ReportCardDetailsFailed(errorMessage: errorMessage);
    }, (reportCardData) {
      state = ReportCardDetailsSuccess(reportCardDetailsModel: reportCardData);
    });
  }
}
