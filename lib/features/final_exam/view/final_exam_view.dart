import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/exam_question_params.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/save_exam_params.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/view_model/fina_exam_state.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/view_model/final_exam_view_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/widgets/language_button.dart';
import 'package:skill_in_a_box_flutter/features/quiz/widgets/quiz_options.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';

@RoutePage()
class FinalExamScreen extends ConsumerStatefulWidget {
  const FinalExamScreen({
    required this.duration,
    required this.examQuestionParams,
    super.key,});
  final int duration;
  final ExamQuestionParams examQuestionParams;

  @override
  ConsumerState createState() => QuizQuestionScreenState();
}

class QuizQuestionScreenState extends ConsumerState<FinalExamScreen> {
  TextEditingController answerController = TextEditingController();
  List<String> selectedOptions = [];
  int questionNo = 1;
  // final language = 'english';

  String selectedLanguage = 'English';


  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   ref.read(finalExamViewModelNotifier.notifier)
    //       .getExamQuestion(
    //     examQuestionParams: widget.examQuestionParams,
    //     questionNo: questionNo,);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final countdown = ref.watch(countdownProvider(widget.duration));
    final finalExamState = ref.watch(finalExamViewModelNotifier);
    final dark = AppHelpers.isDarkMode(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Tools of Fashion'),
      body: finalExamState is ExamQuestionStateLoading
          ? Center(child: CircularProgressIndicator(color: orange.shade500,),)
          : finalExamState is ExamQuestionStateFailure
          ? Center(child: Text(finalExamState.message),)
          : finalExamState is ExamQuestionStateSuccess
          ? Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(dark ? 'assets/images/exam_bg_dark.png':'assets/images/exam_bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SafeArea(
                      child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      // _buildLanguageSelector(),
                      LanguageButton(
                        languages: const [
                          'English',
                          'Hindi',
                        ],
                        selectedLanguage: selectedLanguage,
                      ),
                      SizedBox(width: context.screenWidth *0.05,),
                      _buildTimer(countdown),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$questionNo of '
                              '${finalExamState
                              .finalExamQuestionModel.totalQuestions}',
                          style: heading2.copyWith(color: orange.shade500),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          // currentQuestion['question'].toString(),
                          selectedLanguage.toLowerCase() == 'english'
                              ? AppHelpers.removeHtmlTags(
                            finalExamState.finalExamQuestionModel.question
                                .content.english!.question!,)
                              :AppHelpers.removeHtmlTags(
                            finalExamState.finalExamQuestionModel.question
                                .content.hindi!.question!,),
                          style: heading2.copyWith(
                              color: silverChalice.shade800,),
                        ),
                        const SizedBox(height: 20),
                        if (finalExamState.finalExamQuestionModel
                            .question.type == 'text')
                          CustomTextField(
                            hintText: '',
                            controller: answerController,
                          )
                        else Expanded(
                          child: ListView.builder(
                            itemCount:
                            selectedLanguage.toLowerCase() == 'english'
                                ? finalExamState.finalExamQuestionModel.question
                                .content.english?.options!.length
                                :finalExamState.finalExamQuestionModel.question
                                .content.hindi?.options!.length,
                            itemBuilder: (context, index) {
                              final isMultipleAnswers =
                              selectedLanguage.toLowerCase() == 'english'
                                  ? finalExamState.finalExamQuestionModel
                                  .question.content.english!.isMultipleAnswers!
                                  :finalExamState.finalExamQuestionModel
                                  .question.content.hindi!.isMultipleAnswers!;
                              final optionId =
                              selectedLanguage.toLowerCase() == 'english'
                                  ? finalExamState.finalExamQuestionModel
                                  .question.content.english!.options![index].id
                                  : finalExamState.finalExamQuestionModel
                                  .question.content.hindi!.options![index].id;

                              final isSelected = isMultipleAnswers
                                  ? selectedOptions.contains(optionId)
                                  : selectedOptions.isNotEmpty
                                  && selectedOptions[0] == optionId;

                              final optionTitle =
                              selectedLanguage.toLowerCase() == 'english'
                                  ? finalExamState.finalExamQuestionModel
                                  .question.content.english!.options![index]
                                  .option
                                  : finalExamState.finalExamQuestionModel
                                  .question.content.hindi!
                                  .options![index].option;


                              return QuizOption(
                                selectedBgColor: orange.shade200,
                                selectedColor: orange.shade500,
                                selectedIcon: const Icon(Icons.check,
                                  color: Colors.white, size: 16,),
                                label: String.fromCharCode(65 + index),
                                text: optionTitle,
                                isSelected: isSelected,
                                onTap: () => _handleOptionTap(
                                  optionId, isMultipleAnswers,),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildNavigationButtons(
                    finalExamState.finalExamQuestionModel.totalQuestions,
                    finalExamState.finalExamQuestionModel.question.id,
                    finalExamState.finalExamQuestionModel.question.type,
                  ),
                ],
              ),
                      ),
                    ),
            ],
          )
          : const SizedBox(),

    );
  }

  Widget _buildTimer(String countdown) {
    return Flexible(
      flex: 2,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37),
          border: Border.all(color: orange.shade500),
          color: orange.shade200,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.icons.quizTimer),
            SizedBox(width: context.screenWidth*0.02,),
            Expanded(
              flex: 2,
              child: Text(
                countdown.padLeft(2, '0'),
                style: subtitle3.copyWith(color: orange.shade500),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _handleOptionTap(String optionId, bool isMultipleAnswers) {
    setState(() {
      if (isMultipleAnswers) {
        if (selectedOptions.contains(optionId)) {
          selectedOptions.remove(optionId);
        } else {
          selectedOptions.add(optionId);
        }
      } else {
        selectedOptions = [optionId];
      }
    });
  }

  Widget _buildNavigationButtons(int totalQuestion,
      String questionId,String questionType,) {
    return Row(
      mainAxisAlignment: questionNo == 1
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
      children: [
        if (questionNo != 1)
          GestureDetector(
            onTap: () {
              setState(() {
                questionNo -= 1;
                selectedOptions.clear();
                answerController.clear();
              });
              ref.read(finalExamViewModelNotifier.notifier)
                  .getExamQuestion(
                examQuestionParams: widget.examQuestionParams,
                questionNo: questionNo,);
            },
            child: _buildButton('Previous Question', isPrimary: false),
          ),
        SizedBox(
          width: context.screenWidth*0.3,
          height: 44,
          child: ElevatedButton(
            onPressed: () async {
              final saveExamParams = SaveExamParams(
                questionId: questionId,
                courseId: widget.examQuestionParams.courseId,
                examId: widget.examQuestionParams.examId,
                submittedAnswer: questionType == 'text'
                    ? [answerController.text]:selectedOptions,
                submittedLanguage: selectedLanguage,
              );
              await ref.read(finalExamViewModelNotifier.notifier)
                  .saveAnswer(saveExamParams: saveExamParams,
                questionNo: questionNo,);
              if (questionNo == totalQuestion) {
                /// call submit final exam api
                await ref.read(finalExamViewModelNotifier.notifier)
                    .submitExam(examId: widget.examQuestionParams.examId,
                  courseId: widget.examQuestionParams.courseId,);

                final submitExamState = ref.read(finalExamViewModelNotifier);
                if (submitExamState is SubmitExamStateSuccess) {
                  await ref.read(finalExamViewModelNotifier.notifier)
                      .submissionDetails(
                    courseId: widget.examQuestionParams.courseId,
                    examId:  widget.examQuestionParams.examId,)
                      .then((_) {
                    final finalExamSubmissionState =
                    ref.read(finalExamViewModelNotifier);
                    if (finalExamSubmissionState is ExamSubmissionStateSuccess) {
                      context.router.push(
                        FinalExamOverviewRoute(
                          examSubmissionData:
                          finalExamSubmissionState.examSubmissionModel,),);
                    }
                  });
                }
              }
              else {
                setState(() {
                  questionNo += 1;
                });
                await ref.read(finalExamViewModelNotifier.notifier)
                    .getExamQuestion(
                  examQuestionParams: widget.examQuestionParams,
                  questionNo: questionNo,);

                selectedOptions.clear();
                answerController.clear();
              }

            },
            child: FittedBox(child: Text(questionNo == totalQuestion
                ? 'Save & Submit'
                : 'Next Question',),),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text, {required bool isPrimary}) {
    return Container(
      width: context.screenWidth *0.3,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isPrimary
            ? orange.shade500
            : Colors.transparent,),
        color: isPrimary ? orange.shade200 : Colors.transparent,
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            text,
            style: subtitle1.copyWith(color: orange.shade500),
          ),
        ),
      ),
    );
  }
}

final countdownProvider =
StateNotifierProvider.family<CountdownNotifier, String, int>(
      (ref, durationInMinutes) {
    return CountdownNotifier(initialDurationInMinutes: durationInMinutes);
  },
);

class CountdownNotifier extends StateNotifier<String> {
  CountdownNotifier({required this.initialDurationInMinutes})
      : _remainingSeconds = initialDurationInMinutes * 60,
        super(_formatTime(initialDurationInMinutes * 60)) {
    startTimer();
  }

  final int initialDurationInMinutes;
  int _remainingSeconds; // Store total remaining seconds
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        state = _formatTime(_remainingSeconds);
      } else {
        _timer?.cancel();
        onTimerComplete();
      }
    });
  }

  void resetTimer(int newDurationInMinutes) {
    _timer?.cancel();
    _remainingSeconds = newDurationInMinutes * 60;
    state = _formatTime(_remainingSeconds);
    startTimer();
  }

  static String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}'
        ':${seconds.toString().padLeft(2, '0')}';
  }

  void onTimerComplete() {
    debugPrint('Timer completed!');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
