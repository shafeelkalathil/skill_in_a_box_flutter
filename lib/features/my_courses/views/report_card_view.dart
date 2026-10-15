import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/report_card_view_model/fetch_report_cards_view_model/report_card_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/report_card_view_model/fetch_report_cards_view_model/report_card_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/report_card_view_model/report_card_details_view_model/report_card_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/progress_report_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

class ReportCardView extends ConsumerWidget {
  const ReportCardView({required this.courses, super.key});
  final Courses courses;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportCardState = ref.watch(reportCardViewModelProvider);
    return Scaffold(
      backgroundColor: const Color(0xfff9fbfd),
      appBar: const CustomAppBar(
        title: 'Report Card',
        backgroundColor: Color(0xfff9fbfd),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
        child: Column(
          children: [
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            if (reportCardState is ReportCardSuccess)
              reportCardState.reportCardModel.reportCard == null
                  ? SizedBox(
                      width: context.screenWidth,
                      height: context.screenHeight * 0.6,
                      child: Center(
                        child: Text(
                          'No Reports to Show',
                          style: subtitle1,
                        ),
                      ),
                    )
                  : reportSuccessView(reportCardState, ref)
            else if (reportCardState is ReportCardFailed)
              CustomErrorWidget(
                errorMessage: reportCardState.errorMessage,
                onPressed: () {
                  ref
                      .read(reportCardViewModelProvider.notifier)
                      .fetchReportCards(courseId: courses.courseDetails!.id!);
                },
              )
            else
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomGridView(
                      childAspectRatio: 0.8,
                      itemLength: 6,
                      itemBuilder: (context, index) {
                        return ShimmerCard(
                          width: context.screenWidth * 0.4,
                          height: context.screenHeight * 0.2,
                          borderRadius: 16,
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Expanded reportSuccessView(ReportCardSuccess reportCardState, WidgetRef ref) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomGridView(
            childAspectRatio: 0.8,
            itemLength: reportCardState.reportCardModel.reportCard?.length ?? 0,
            itemBuilder: (context, index) {
              final reportCardData =
                  reportCardState.reportCardModel.reportCard![index];
              return GestureDetector(
                onTap: () {
                  ref
                      .read(
                        reportCardDetailsViewModelProvider(
                          reportCardData.sectionId!,
                        ).notifier,
                      )
                      .fetchReportCardDetails(
                        reportCardId: reportCardData.id!,
                        sectionId: reportCardData.sectionId!,
                      );
                  context.router.push(
                    ProgressReportViewRoute(
                      reportCardId: reportCardData.id!,
                        sectionId: reportCardData.sectionId!,),
                  );
                },
                child: ProgressReportCard(
                  date: reportCardData.reportDate!,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
