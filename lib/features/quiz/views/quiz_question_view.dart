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
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_question/quiz_question_state.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_question/quiz_question_view_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/save_question_answer/save_question_answer_view_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/save_question_answer/save_question_body.dart';
import 'package:skill_in_a_box_flutter/features/quiz/widgets/language_button.dart';
import 'package:skill_in_a_box_flutter/features/quiz/widgets/quiz_options.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

import 'package:skill_in_a_box_flutter/features/my_courses/widgets/custom_alert_box.dart';

@RoutePage()
class QuizQuestionScreen extends ConsumerStatefulWidget {
  const QuizQuestionScreen({required this.duration,
    required this.quizBodyParams, super.key,});
  final int duration;
  final QuizBodyParams quizBodyParams;

  @override
  ConsumerState createState() => QuizQuestionScreenState();
}

class QuizQuestionScreenState extends ConsumerState<QuizQuestionScreen> {
  List<String> selectedOptions = [];
  int questionNo = 1;
  // final language = 'english';

  String selectedLanguage = 'English';


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(quizQuestionViewModelModelNotifier.notifier)
          .getQuizQuestion(
          quizSummaryParams: widget.quizBodyParams,
          questionNo: questionNo,);
    });
  }

  @override
  Widget build(BuildContext context) {
    final countdown = ref.watch(countdownProvider(widget.duration));
    final quizQuestionState = ref.watch(quizQuestionViewModelModelNotifier);
    final dark = AppHelpers.isDarkMode(context);

    // if(countdown == 0){
    // showDialog<dynamic>(
    //   context: context,
    //   builder: (context) {
    //     return const CustomAlertBox(
    //       title: 'Time Out',
    //       subtitle:
    //       'Complete the previous lesson or wait for the scheduled release'
    //           ' to access this content.',
    //     );
    //   },
    // );
    // }

    return Scaffold(
      appBar: const CustomAppBar(title: 'Tools of Fashion'),
      body: quizQuestionState is QuizQuestionLoading
          ? Center(child: CircularProgressIndicator(color: orange.shade500,),)
          : quizQuestionState is QuizQuestionFailure
          ? Center(child: Text(quizQuestionState.message),)
          : quizQuestionState is QuizQuestionSuccess
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
                      children: [
                        Text(
                          '$questionNo of '
                          '${quizQuestionState.quizQuestionModel
                              .totalQuestions}',
                          style: heading2.copyWith(color: orange.shade500),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          // currentQuestion['question'].toString(),
                          selectedLanguage.toLowerCase() == 'english'
                              ? AppHelpers.removeHtmlTags(
                              quizQuestionState.quizQuestionModel.question
                                  .content.english.question,)
                              :AppHelpers.removeHtmlTags(
                              quizQuestionState.quizQuestionModel.question
                                  .content.hindi.question,),
                          style: heading2.copyWith(color: dark
                              ? Colors.white : silverChalice.shade800,),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            itemCount: selectedLanguage.toLowerCase() ==
                                'english'
                                ? quizQuestionState.quizQuestionModel.question
                                .content.english.options.length
                                :quizQuestionState.quizQuestionModel.question
                                .content.hindi.options.length,
                            itemBuilder: (context, index) {
                              final isMultipleAnswers =
                              selectedLanguage.toLowerCase() == 'english'
                                  ? quizQuestionState.quizQuestionModel.question
                                  .content.english.isMultipleAnswers
                                  :quizQuestionState.quizQuestionModel.question
                                  .content.hindi.isMultipleAnswers;
                              final optionId =
                              selectedLanguage.toLowerCase() == 'english'
                                  ? quizQuestionState.quizQuestionModel.question
                                  .content.english.options[index].id
                                  : quizQuestionState.quizQuestionModel.question
                                  .content.hindi.options[index].id;

                              final isSelected = isMultipleAnswers
                                  ? selectedOptions.contains(optionId)
                                  : selectedOptions.isNotEmpty
                                  && selectedOptions[0] == optionId;

                              final optionTitle =
                              selectedLanguage.toLowerCase() == 'english'
                                  ? quizQuestionState.quizQuestionModel.question
                                  .content.english.options[index].option
                                  : quizQuestionState.quizQuestionModel.question
                                  .content.hindi.options[index].option;


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
                      quizQuestionState.quizQuestionModel.totalQuestions,
                      quizQuestionState.quizQuestionModel.question.id,),
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

  Widget _buildNavigationButtons(int totalQuestion,String questionId) {
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
              });

              ref.read(quizQuestionViewModelModelNotifier.notifier)
                  .getQuizQuestion(quizSummaryParams: widget.quizBodyParams,
                  questionNo: questionNo,);
            },
            child: _buildButton('Previous Question', isPrimary: false),
          ),
        SizedBox(
          width: context.screenWidth*0.3,
          height: 44,
          child: ElevatedButton(
            onPressed: () async {
              final saveQuizBody = SaveQuestionBody(
                questionId: questionId,
                courseId: widget.quizBodyParams.courseId,
                sectionId: widget.quizBodyParams.sectionId,
                quizId: widget.quizBodyParams.quizId,
                submittedAnswer: selectedOptions,
                submittedLanguage: selectedLanguage,
              );
              await ref.read(saveQuestionAnswerViewModelModelNotifier.notifier)
                  .saveQuestionAnswer(saveQuizBody: saveQuizBody,
                questionNo: questionNo,);
              if (questionNo == totalQuestion) {

                ///call submit quiz api
                await ref.read(quizQuestionViewModelModelNotifier.notifier)
                    .submitQuiz(quizSummaryParams: widget.quizBodyParams)
                    .then((_) {
                  final submitQuizState = ref.read(
                      quizQuestionViewModelModelNotifier,);
                  if (submitQuizState is SubmitQuizSuccess) {
                    context.router.pushAndPopUntil(QuizSummaryRoute(
                      quizBodyParams: widget.quizBodyParams,),
                      predicate: (route) => false,);
                  }
                });
              }
              else {
                setState(() {
                  questionNo += 1;
                });
                await ref.read(quizQuestionViewModelModelNotifier.notifier)
                    .getQuizQuestion(quizSummaryParams: widget.quizBodyParams,
                    questionNo: questionNo,);

                selectedOptions.clear();
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
