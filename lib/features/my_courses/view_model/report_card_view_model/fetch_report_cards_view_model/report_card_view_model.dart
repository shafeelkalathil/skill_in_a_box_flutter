import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/my_course_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/report_card_view_model/fetch_report_cards_view_model/report_card_states.dart';

final reportCardViewModelProvider =
    StateNotifierProvider<ReportCardViewModel, ReportCardStates>(
  (ref) => ReportCardViewModel(ref.watch(myCourseRepositoryProvider)),
);

class ReportCardViewModel extends StateNotifier<ReportCardStates> {
  ReportCardViewModel(this.myCourseRepository) : super(ReportCardInitial());

  final MyCourseRepository myCourseRepository;

  Future<void> fetchReportCards({
    required String courseId,
  }) async {
    state = ReportCardLoading();
    final response = await myCourseRepository.fetchReportCards(
      courseId: courseId,
    );
    response.fold((errorMessage) {
      state = ReportCardFailed(errorMessage: errorMessage);
    }, (reportCardData) {
      state = ReportCardSuccess(reportCardModel: reportCardData);
    });
  }
}
