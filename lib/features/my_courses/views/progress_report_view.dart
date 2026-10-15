import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/report_card_view_model/report_card_details_view_model/report_card_details_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/report_card_view_model/report_card_details_view_model/report_card_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

@RoutePage()
class ProgressReportViewScreen extends ConsumerWidget {
  const ProgressReportViewScreen({
    required this.sectionId,
    required this.reportCardId,
    super.key,
  });
  final String sectionId;
  final String reportCardId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressDetailsState =
        ref.watch(reportCardDetailsViewModelProvider(sectionId));
    return Scaffold(
      backgroundColor: const Color(0xfff9fbfd),
      appBar: const CustomAppBar(
        title: 'Progress Report',
        backgroundColor: Color(0xfff9fbfd),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.06),
        child: SingleChildScrollView(
          child: Builder(
            builder: (context) {
              if (progressDetailsState is ReportCardDetailsSuccess) {
                final reportCardData =
                    progressDetailsState.reportCardDetailsModel.reportCard;
                return Column(
                  children: [
                    whiteCard(
                      context,
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: context.screenWidth * 0.1,
                              backgroundImage: NetworkImage(
                                reportCardData?.studentProfilePic??'https://pixabay.com/vectors/blank-profile-picture-mystery-man-973460/',
                              ),),
                          SizedBox(
                            width: context.screenWidth * 0.03,
                          ),
                          SizedBox(
                            width: context.screenWidth * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${reportCardData?.studentFirstName ?? 'FirstName'} ${reportCardData?.studentLastName ?? ''}',
                                  style: heading3.copyWith(
                                    color: silverChalice.shade900,
                                  ),
                                ),
                                Text(
                                  reportCardData?.courseTitle ?? 'title',
                                  style: heading4.copyWith(
                                    color: silverChalice.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.screenWidth * 0.04,
                    ),
                    whiteCard(
                      context,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Weekly Report Date',
                                style: heading4.copyWith(color: silverChalice),
                              ),
                              Text(
                                DateFormat('dd MMMM, y').format(
                                  DateTime.parse(
                                    reportCardData!.reportDate!,
                                  ),
                                ),
                                style: heading3.copyWith(
                                  color: silverChalice.shade800,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: context.screenHeight * 0.04,
                            color: silverChalice.shade200,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Attendence',
                                style: heading4.copyWith(color: silverChalice),
                              ),
                              Text(
                                '5/7',
                                style: heading3.copyWith(
                                  color: silverChalice.shade800,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.screenWidth * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        progressReport(
                          (reportCardData.completedLesson! /
                                  reportCardData.completedLesson!) *
                              100,
                          'Lesson Progress',
                          'Lessons finished - ${reportCardData.completedLesson}',
                          context,
                          orange,
                          Text(
                            '${((reportCardData.completedLesson! / reportCardData.completedLesson!) * 100).floor()}%',
                            style:
                                heading1.copyWith(fontSize: 24, color: orange),
                          ),
                        ),
                        progressReport(
                          (reportCardData.obtainedQuizMark! /
                                      reportCardData.totalQuizMark! ==
                                  0
                              ? 1
                              : reportCardData.totalQuizMark!.toDouble()),
                          'Quiz Marks',
                          'Quiz Attended - ${reportCardData.quizAttended}',
                          context,
                          seagull,
                          Text(
                            '${reportCardData.obtainedQuizMark} / ${reportCardData.totalQuizMark}',
                            style: subtitle3.copyWith(color: seagull),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.screenWidth * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        progressReport(
                          reportCardData.obtainedAssignmentMark! /
                              reportCardData.totalAssignmentMark!,
                          'Assignment Marks',
                          'Assignments Submitted - ${reportCardData.assignmentSubmitted}',
                          context,
                          const Color(0xfffcb833),
                          Text(
                            '${reportCardData.obtainedAssignmentMark!} / ${reportCardData.totalAssignmentMark!}',
                            style: subtitle3.copyWith(
                              color: const Color(0xfffcb833),
                            ),
                          ),
                        ),
                        gaugeIndicator(context, 3),
                      ],
                    ),
                    SizedBox(
                      height: context.screenWidth * 0.04,
                    ),
                  ],
                );
              } else if (progressDetailsState is ReportCardDetailsFailed) {
                return CustomErrorWidget(
                  errorMessage: progressDetailsState.errorMessage,
                  onPressed: () {
                    ref
                        .read(
                          reportCardDetailsViewModelProvider(sectionId)
                              .notifier,
                        )
                        .fetchReportCardDetails(
                          reportCardId: reportCardId,
                          sectionId: sectionId,
                        );
                  },
                );
              } else {
                return ShimmerCard(
                  width: context.screenWidth,
                  height: context.screenHeight * 0.6,
                  borderRadius: 16,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget whiteCard(
    BuildContext context, {
    required Widget child,
    double? width,
    double? height,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(
        vertical: context.screenWidth * 0.04,
        horizontal: context.screenWidth * 0.03,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffe7e7e7),
        ),
      ),
      child: child,
    );
  }

  Widget progressReport(
    double progress,
    String title,
    String subtitle,
    BuildContext context,
    Color progressColor,
    Widget stackedWidget,
  ) {
    return whiteCard(
      width: context.screenWidth * 0.42,
      height: context.screenHeight * 0.25,
      context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: subtitle3.copyWith(color: silverChalice.shade900),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: context.screenWidth * 0.2,
                height: context.screenWidth * 0.2,
                child: CircularProgressIndicator(
                  color: progressColor,
                  backgroundColor: silverChalice.shade100,
                  value: progress,
                ),
              ),
              stackedWidget,
            ],
          ),
          Text(
            subtitle,
            style: body1.copyWith(color: silverChalice.shade900),
          ),
        ],
      ),
    );
  }

  Widget gaugeIndicator(BuildContext context, double value) {
    return whiteCard(
      context,
      width: context.screenWidth * 0.42,
      height: context.screenHeight * 0.25,
      child: Column(
        children: [
          Text(
            'Discipline Mark',
            style: subtitle3.copyWith(color: silverChalice.shade900),
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: context.screenWidth * 0.42,
                height: context.screenHeight * 0.1,
                child: AnimatedRadialGauge(
                  duration: const Duration(seconds: 1),
                  value: 0,
                  axis: GaugeAxis(
                    pointer: null,
                    progressBar: const GaugeProgressBar.basic(
                      color: Color(0xFFB4C2F8),
                    ),
                    segments: segments(value),
                  ),
                ),
              ),
              Text(
                '${value.floor()}/5',
                style: heading1.copyWith(color: silverChalice.shade900),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<GaugeSegment> segments(double value) {
    final segments = [
      GaugeSegment(from: 0, to: 0.2, color: vividTangerine.shade400),
      GaugeSegment(from: 0.2, to: 0.4, color: orange),
      GaugeSegment(from: 0.4, to: 0.6, color: zest.shade300),
      GaugeSegment(from: 0.6, to: 0.8, color: seagull.shade300),
      GaugeSegment(from: 0.8, to: 1, color: seagull),
    ];

    return segments.take(value.floor()).toList();
  }
}
