import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_view_model/assignment_view_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/view_model/course_section_view_model/course_section_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/curriculum_model/curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/curriculum_view_model/curriculum_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/curriculum_view_model/curriculum_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/notes_view_model/notes_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/section_details_view_model/section_details_state.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/section_details_view_model/section_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/custom_alert_box.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_section_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/widgets/doubt_item.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_overview/quiz_overview_state.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_overview/quiz_overview_view_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_status_view_model/quiz_status_state.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_status_view_model/quiz_status_view_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class CustomExpansionTile extends ConsumerStatefulWidget {
  const CustomExpansionTile({
    required this.courseId,
    required this.sectionId,
    required this.courseData,
    this.curriculumModel,
    super.key,
    this.title,
    this.trailing,
    this.isDatePassed,
    this.isOrange = false,
    this.isDoubtBox = false,
    this.isCoursePage = false,
  });
  final String? title;
  final Widget? trailing;
  final bool? isDatePassed;
  final bool isOrange;
  final String courseId;
  final String sectionId;
  final Courses courseData;
  final CurriculumModel? curriculumModel;
  final bool isDoubtBox;
  final bool isCoursePage;
  @override
  ConsumerState<CustomExpansionTile> createState() =>
      _CustomExpansionTileState();
}

class _CustomExpansionTileState extends ConsumerState<CustomExpansionTile> {
  bool thumbUpSelected = false;
  bool thumbDownSelected = false;
  void toggleThumbUp(WidgetRef ref, String doubtId) {
    setState(() {
      thumbUpSelected = !thumbUpSelected;
      thumbDownSelected = false;
      ref
          .read(doubtBoxViewModelProvider(widget.sectionId).notifier)
          .handlingLike(
            courseId: widget.courseId,
            sectionId: widget.sectionId,
            doubtId: doubtId,
            type: 'like',
          );
    });
  }

  void toggleThumbDown(WidgetRef ref, String doubtId) {
    setState(() {
      thumbDownSelected = !thumbDownSelected;
      thumbUpSelected = false;
      ref
          .read(doubtBoxViewModelProvider(widget.sectionId).notifier)
          .handlingLike(
            courseId: widget.courseId,
            sectionId: widget.sectionId,
            doubtId: doubtId,
            type: 'dislike',
          );
    });
  }

  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final sectionState =
        ref.watch(sectionDetailsViewModelProvider(widget.sectionId));
    final courseSectionState = ref.watch(
      courseSectionViewModelProvider(widget.sectionId),
    );
    final curriculumState = ref.watch(
      curriculumViewModelProvider(
        widget.courseId,
      ),
    );
    final doubtBoxState =
        ref.watch(doubtBoxViewModelProvider(widget.sectionId));
    return ExpansionTile(
      title: Text(
        widget.title ?? 'Title',
        style: heading3,
      ),
      onExpansionChanged: (value) {
        onExpansionChanged(value: value);
      },
      leading: LeadingWidget(isExpanded: _isExpanded, widget: widget),
      trailing: widget.trailing ?? const SizedBox.shrink(),
      collapsedBackgroundColor: widget.isOrange ? orange : null,
      backgroundColor: widget.isOrange ? orange : null,
      textColor: widget.isOrange ? const Color(0xffffffff) : null,
      collapsedTextColor: widget.isOrange ? const Color(0xffffffff) : null,
      children: widget.isDoubtBox
          ? doubtBoxChildren(doubtBoxState, context)
          : widget.isCoursePage
              ? coursePageCurriculum(courseSectionState, context)
              : curriculumChildren(sectionState, curriculumState, context),
    );
  }

  List<Widget> coursePageCurriculum(
    SectionDetailsStates sectionState,
    BuildContext context,
  ) {
    return (sectionState is SectionDetailsSuccess)
        ? List.generate(sectionState.sectionUiModel.length, (index) {
            final lessonDetails = sectionState.sectionUiModel[index];
            final isCurrentLesson =
                (sectionState.currentLesson == lessonDetails.id);

            return expandedTile(
              isLocked: lessonDetails.isLocked,
              isCurrentLesson: isCurrentLesson,
              lessonId: lessonDetails.id,
              title: lessonDetails.title,
              context: context,
              type: lessonDetails.type,
            );
          })
        : [
            ShimmerCard(
              width: context.screenWidth,
              height: context.screenHeight * 0.06,
              borderRadius: 8,
            ),
          ];
  }

  List<Widget> curriculumChildren(
    SectionDetailsStates sectionState,
    CurriculumStates curriculumState,
    BuildContext context,
  ) {
    return (sectionState is SectionDetailsSuccess &&
            curriculumState is CurriculumSuccess)
        ? List.generate(sectionState.sectionUiModel.length, (index) {
            final lessonDetails = sectionState.sectionUiModel[index];
            final isCurrentLesson =
                (sectionState.currentLesson == lessonDetails.id);

            return expandedTile(
              isLocked: lessonDetails.isLocked,
              isCurrentLesson: isCurrentLesson,
              lessonId: lessonDetails.id,
              title: lessonDetails.title,
              context: context,
              type: lessonDetails.type,
            );
          })
        : [
            ShimmerCard(
              width: context.screenWidth,
              height: context.screenHeight * 0.06,
              borderRadius: 8,
            ),
          ];
  }

  List<Widget> doubtBoxChildren(
    DoubtBoxStates doubtBoxState,
    BuildContext context,
  ) {
    return (doubtBoxState is DoubtBoxSectionSuccess)
        ? List.generate(
            doubtBoxState.doubtBoxSectionDetailsModel.doubtBoxData?.length ?? 0,
            (index) {
            final doubtData =
                doubtBoxState.doubtBoxSectionDetailsModel.doubtBoxData?[index];
            return DoubtItem(
              doubtData: doubtData,
              index: index,
              courseId: widget.courseId,
              sectionId: widget.sectionId,
            );
          })
        : [
            ShimmerCard(
              width: context.screenWidth,
              height: context.screenHeight * 0.06,
              borderRadius: 8,
            ),
          ];
  }

  void onExpansionChanged({required bool value}) {
    if (value) {
      widget.isDoubtBox
          ? ref
              .read(doubtBoxViewModelProvider(widget.sectionId).notifier)
              .fetchDoubtBoxSectionDetails(
                courseId: widget.courseId,
                sectionId: widget.sectionId,
              )
          : widget.isCoursePage
              ? ref
                  .read(
                    courseSectionViewModelProvider(widget.sectionId).notifier,
                  )
                  .fetchCourseSection(
                    courseId: widget.courseId,
                    sectionId: widget.sectionId,
                  )
              : ref
                  .read(
                    sectionDetailsViewModelProvider(widget.sectionId).notifier,
                  )
                  .fetchSectionDetails(
                    ref: ref,
                    courseId: widget.courseId,
                    sectionId: widget.sectionId,
                  );
    }

    setState(() {
      _isExpanded = value;
    });
  }

  String getIcon(String lessonType) {
    if (lessonType == SectionType.audio.name) {
      return Assets.icons.mic;
    } else if (lessonType == SectionType.video.name) {
      return Assets.icons.video;
    } else if (lessonType == SectionType.quiz.name) {
      return Assets.icons.quiz;
    } else if (lessonType == SectionType.assignments.name) {
      return Assets.icons.assignment;
    } else if (lessonType == SectionType.pdf.name) {
      return Assets.icons.pdf;
    } else if (lessonType == SectionType.slides.name) {
      return Assets.icons.slide;
    } else {
      return Assets.icons.mic;
    }
  }

  Widget expandedTile({
    required String title,
    required BuildContext context,
    required String type,
    required String lessonId,
    required bool isLocked,
    required bool isCurrentLesson,
  }) {
    return GestureDetector(
      onTap: () {
        //locked

        if (isLocked) {
          showDialog<dynamic>(
            context: context,
            builder: (context) {
              return const CustomAlertBox(
                title: 'Lesson is Locked',
                subtitle:
                    'Complete the previous lesson or wait for the scheduled '
                    'release to access this content.',
              );
            },
          );

          // video, audio, pdf, slides
        } else if (type == SectionType.video.name ||
            type == SectionType.pdf.name ||
            type == SectionType.audio.name ||
            type == SectionType.slides.name) {
          context.router.push(
            CourseContentRoute(
              sectionId: widget.sectionId,
              lessonId: lessonId,
              courseData: widget.courseData,
              curriculumModel: widget.curriculumModel!,
              type: type,
            ),
          );
          ref.read(notesViewModelProvider.notifier).fetchNotes(
                courseId: widget.courseId,
                lessonId: lessonId,
                sectionId: widget.sectionId,
              );

          // quiz
        } else if (type == SectionType.quiz.name) {
          final quizBodyParams = QuizBodyParams(
            quizId: lessonId,
            courseId: widget.courseId,
            sectionId: widget.sectionId,
          );

          ///call quiz status
          ref
              .read(quizStatusViewModelNotifier.notifier)
              .getQuizStatus(
                quizSummaryParams: quizBodyParams,
              )
              .then(
            (value) {
              final quizStatusState = ref.read(quizStatusViewModelNotifier);
              if (quizStatusState is QuizStatusStateSuccess) {
                if (quizStatusState.quizStatusModel.status == 'pending') {
                  ref
                      .read(quizOverviewViewModelNotifier.notifier)
                      .getQuizOverview(quizBodyParams: quizBodyParams)
                      .then(
                    (value) {
                      final quizOverviewState =
                          ref.read(quizOverviewViewModelNotifier);
                      if (quizOverviewState is GetQuizOverviewSuccess) {
                        context.router.push(
                          QuizDetailsRoute(quizBodyParams: quizBodyParams),
                        );
                      } else if (quizOverviewState is GetQuizOverviewFailure) {
                        print(quizOverviewState.message);
                        print('Not added to batch yet!');
                      } else {
                        print('loading');
                      }
                    },
                  );
                } else {
                  context.router.push(
                    QuizSummaryRoute(quizBodyParams: quizBodyParams),
                  );
                }
              }
            },
          );

          // print('aaaa');
          // final quizBodyParams = QuizBodyParams(
          //   quizId: lessonId,
          //   courseId: widget.courseId,
          //   sectionId: widget.sectionId,
          // );
          //
          // ref
          //     .read(quizOverviewViewModelNotifier.notifier)
          //     .getQuizOverview(quizBodyParams: quizBodyParams)
          //     .then((_) {
          //   final quizOverviewState = ref.read(quizOverviewViewModelNotifier);
          //   if (quizOverviewState is GetQuizOverviewSuccess) {
          //     print('bbbbbbbbbbb');
          //     context.router.push(
          //       QuizDetailsRoute(quizBodyParams: quizBodyParams),
          //     );
          //   } else {
          //     print('ccccccccc');
          //     context.router.push(
          //       QuizSummaryRoute(quizBodyParams: quizBodyParams),
          //     );
          //   }
          // });
        }

        //assignment

        else if (type == SectionType.assignments.name) {
          ref.read(assignmentViewModelProvider.notifier).fetchAssignment(
                courseId: widget.courseId,
                lessonId: lessonId,
                sectionId: widget.sectionId,
              );
          context.router.push(
            AssignmentViewRoute(
              lessonId: lessonId,
              courseId: widget.courseId,
              sectionId: widget.sectionId,
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isCurrentLesson ? orange.shade50 : const Color(0xffffffff),
          border: Border(top: BorderSide(color: silverChalice.shade100)),
        ),
        // height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.screenWidth * 0.08,
                ),
                SvgPicture.asset(
                  getIcon(type),
                  width: 20,
                ),
                Container(
                  width: context.screenWidth * 0.6,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.06,
                    vertical: context.screenWidth * 0.03,
                  ),
                  child: Text(
                    title,
                    style: subtitle3.copyWith(color: silverChalice.shade800),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.06),
              child: Builder(
                builder: (context) {
                  if (isLocked) {
                    return SvgPicture.asset(
                      Assets.icons.lock,
                      width: 16,
                      colorFilter:
                          ColorFilter.mode(orange.shade400, BlendMode.srcIn),
                    );
                  } else if (!isLocked && !isCurrentLesson) {
                    return SvgPicture.asset(
                      Assets.icons.tickCircle,
                      width: 16,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeadingWidget extends StatelessWidget {
  const LeadingWidget({
    required bool isExpanded,
    required this.widget,
    super.key,
  }) : _isExpanded = isExpanded;

  final bool _isExpanded;
  final CustomExpansionTile widget;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: _isExpanded ? 0.5 : 0,
      duration: const Duration(milliseconds: 200),
      child: SvgPicture.asset(
        Assets.icons.arrowDown,
        width: 10,
        colorFilter: ColorFilter.mode(
          widget.isOrange ? const Color(0xffffffff) : silverChalice.shade800,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
