import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_state.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_view_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/widgets/quiz_details_info.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';

@RoutePage()
class QuizSummaryScreen extends ConsumerStatefulWidget {
  const QuizSummaryScreen({required this.quizBodyParams,super.key});
  final QuizBodyParams quizBodyParams;

  @override
  ConsumerState<QuizSummaryScreen> createState() => _QuizSummaryScreenState();
}

class _QuizSummaryScreenState extends ConsumerState<QuizSummaryScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(quizSummaryViewModelNotifier.notifier)
          .getQuizSummary(quizSummaryParams: widget.quizBodyParams);
    },);

  }
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    final quizSummaryData = ref.watch(quizSummaryViewModelNotifier);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Quiz Summary'),
      body: quizSummaryData is QuizSummaryLoading
          ? Center(child: CircularProgressIndicator(color: orange.shade500,),)
          : quizSummaryData is QuizSummaryFailure
          ? Center(child: Text(quizSummaryData.message),)
          : quizSummaryData is QuizSummarySuccess
          ? SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: SingleChildScrollView(
            child: Column(
              children: [
                RoundedContainer(
                  widget: Column(
                    children: [
                      // SvgPicture.asset(Assets.images.quizSummary,),
                      const Image(image: AssetImage('assets/images/quiz_summary.png')),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          QuizInfoColumn(
                            width: context.screenWidth * 0.35,
                            items: [
                              QuizInfoItem(title: 'Total Questions',
                                value: quizSummaryData.quizSummaryModel
                                    .summary.totalQuestions.toString(),),
                              QuizInfoItem(title: 'Correct Answers',
                                value: quizSummaryData.quizSummaryModel
                                    .summary.correctAnswers.toString(),
                              isCorrectAnswer: true,),
                              QuizInfoItem(title: 'Unattempted',value:  ''),
                              QuizInfoItem(title: 'Time Taken',
                                value: quizSummaryData.quizSummaryModel
                                    .summary.timeTaken.toString(),),
                            ],
                          ),
                          QuizInfoColumn(
                            width: context.screenWidth * 0.35,
                            items: [
                              QuizInfoItem(
                                title: 'Total Marks',
                                value: quizSummaryData.quizSummaryModel.
                                summary.totalMarks.toString(),),
                              QuizInfoItem(title: 'Incorrect Answers',
                                value: quizSummaryData.quizSummaryModel
                                    .summary.incorrectAnswers.toString(),
                              isInCorrectAnswer: true,),
                              QuizInfoItem(title: 'Marks Obtained',
                                value: quizSummaryData.quizSummaryModel
                                    .summary.markObtained.toString(),),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                context.router.popForced();
                              },
                              child: Container(
                                width: context.screenWidth * 0.35,
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: silverChalice.shade50,
                                  ),
                                ),
                                child: Center(
                                  child: FittedBox(
                                    child: Text('Close',
                                      style:subtitle1.copyWith(
                                        color: dark
                                            ? Colors.white
                                            : silverChalice.shade800,),),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30,),
                          if(quizSummaryData.quizSummaryModel
                              .summary.showAnswer)
                            Flexible(
                            child: SizedBox(
                              width: context.screenWidth * 0.35,
                              height: 44,
                              child: ElevatedButton(onPressed: () {
                                context.router.push(
                                  QuizSummaryDetailsRoute(
                                    quizBodyParams: widget.quizBodyParams,
                                  ),);
                              }, child: const FittedBox(
                                  child: Text('View Details'),),),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
          :const SizedBox(),
    );
  }
}
