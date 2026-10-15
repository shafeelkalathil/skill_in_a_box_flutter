import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/formatters/date_formatter.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/exam_question_params.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/view_model/fina_exam_state.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/view_model/final_exam_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/curriculum_model/curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/custom_alert_box.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class FinalExamExpansionTile extends ConsumerStatefulWidget {
  const FinalExamExpansionTile({
    required this.courseId,
    required this.curriculumModel,
    super.key,
    this.isOrange = false,
  });
  final bool isOrange;
  final String courseId;
  final CurriculumModel curriculumModel;
  @override
  ConsumerState<FinalExamExpansionTile> createState() =>
      _CustomExpansionTileState();
}

class _CustomExpansionTileState extends ConsumerState<FinalExamExpansionTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Final Exam',
        style: heading3,
      ),
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
        });
      },
      leading: AnimatedRotation(
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
      ),
      trailing:  const SizedBox.shrink(),
      collapsedBackgroundColor: widget.isOrange ? orange : null,
      backgroundColor: widget.isOrange ? orange : null,
      textColor: widget.isOrange ? const Color(0xffffffff) : null,
      collapsedTextColor: widget.isOrange ? const Color(0xffffffff) : null,
      children: List.generate(widget.curriculumModel.finalExams?.length ?? 0,
              (index) {
        final finalExamDetails = widget.curriculumModel.finalExams?[index];

        return finalExamExpandedTile(
          finalExam: finalExamDetails!,
          context: context,
        );
      }),
    );
  }

  Widget finalExamExpandedTile({
    required FinalExam finalExam,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        ///locked
        if (finalExam.isLocked) {
          showDialog<dynamic>(
            context: context,
            builder: (context) {
              return const CustomAlertBox(
                title: 'Lesson is Locked',
                subtitle:
                'Complete the previous lesson or wait for the scheduled release'
                    ' to access this content.',
              );
            },
          );
        }
        else{

          ///call final exam status
          ref.read(finalExamViewModelNotifier.notifier)
              .finalExamStatus(
            courseId: widget.courseId,
            examId: finalExam.id,).then((value)  {
            final finalExamStatusState = ref.read(finalExamViewModelNotifier);
            if(finalExamStatusState is FinaExamStatusStateSuccess){
              if(finalExamStatusState.finalExamStatusModel.status == 'pending'){
                /// call start final exam api
                ref.read(finalExamViewModelNotifier.notifier)
                    .startFinalExam(
                  courseId: widget.courseId,
                  examId: finalExam.id,)
                    .then((_) {
                  final finalExamState = ref.read(finalExamViewModelNotifier);
                  if (finalExamState is StartFinaExamStateSuccess) {
                    /// call final exam questions api
                    ref.read(finalExamViewModelNotifier.notifier)
                        .getExamQuestion(
                      examQuestionParams: ExamQuestionParams(
                        examId: finalExam.id,
                        courseId: widget.courseId,),
                      questionNo: 1,);
                    context.router.push(FinalExamRoute(
                      duration: finalExamStatusState
                          .finalExamStatusModel.examData.duration,
                      examQuestionParams: ExamQuestionParams(
                        examId: finalExam.id,
                        courseId: widget.courseId,),
                    ),);
                  }
                  else{
                    ref.read(finalExamViewModelNotifier.notifier)
                        .submissionDetails(
                      courseId: widget.courseId,
                      examId: finalExam.id,)
                        .then((_) {
                      final finalExamSubmissionState =
                      ref.read(finalExamViewModelNotifier);
                      if (finalExamSubmissionState is ExamSubmissionStateSuccess) {
                        context.router.push(
                          FinalExamOverviewRoute(
                            examSubmissionData: finalExamSubmissionState.examSubmissionModel,),);
                      }
                    });
                  }
                });
              }
              else{
                print(finalExam.id);
                print(widget.courseId);
                ref.read(finalExamViewModelNotifier.notifier)
                    .submissionDetails(
                  courseId: widget.courseId,
                  examId: finalExam.id,)
                    .then((_) {
                  final finalExamSubmissionState =
                  ref.read(finalExamViewModelNotifier);
                  if (finalExamSubmissionState is ExamSubmissionStateSuccess) {
                    context.router.push(
                      FinalExamOverviewRoute(
                        examSubmissionData: finalExamSubmissionState.examSubmissionModel,),);
                  }else if(finalExamSubmissionState is ExamSubmissionStateFailure){
                    print('exam data not found');
                  }
                });
              }
            }

            },);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color:  !finalExam.isLocked ? orange.shade50 : const Color(0xffffffff),
          border: Border(top: BorderSide(color: silverChalice.shade100)),
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.screenWidth * 0.08,
                ),
                SvgPicture.asset(
                  Assets.icons.finalExamIcon,
                  width: 20,
                ),
                SizedBox(
                  width: context.screenWidth * 0.06,
                ),
                Text(
                  finalExam.name ?? '',
                  style: subtitle3.copyWith(color: silverChalice.shade800),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.06),
              child: Builder(
                builder: (context) {
                  if (finalExam.isLocked) {
                    return SvgPicture.asset(
                      Assets.icons.lock,
                      width: 16,
                      colorFilter:
                      ColorFilter.mode(orange.shade400, BlendMode.srcIn),
                    );
                  } else if (!finalExam.isLocked) {
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
