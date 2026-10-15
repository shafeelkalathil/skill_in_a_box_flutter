import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_summary_details/data/data.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary_details/quiz_summary_details_state.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary_details/quiz_summary_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/widgets/quiz_options.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

@RoutePage()
class QuizSummaryDetailsScreen extends ConsumerStatefulWidget {
  const QuizSummaryDetailsScreen({required this.quizBodyParams,super.key});
  final QuizBodyParams quizBodyParams;

  @override
  ConsumerState<QuizSummaryDetailsScreen> createState() =>
      _QuizSummaryDetailsScreenState();
}

class _QuizSummaryDetailsScreenState extends
ConsumerState<QuizSummaryDetailsScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(quizSummaryDetailsViewModelNotifier.notifier)
          .getQuizSummaryDetails(quizSummaryParams: widget.quizBodyParams);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    final quizSummaryDetailsData = ref.watch
      (quizSummaryDetailsViewModelNotifier);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Quiz Summary'),
      body: quizSummaryDetailsData is QuizSummaryDetailsLoading
          ? Center(child: CircularProgressIndicator(color: orange.shade500,),)
          : quizSummaryDetailsData is QuizSummaryDetailsFailure
          ? Center(child: Text(quizSummaryDetailsData.message),)
          :quizSummaryDetailsData is QuizSummaryDetailsSuccess
          ? SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < quizSummaryDetailsData
                    .quizSummaryDetailsModel.quizData.data.length; i++)
                  _buildQuizQuestion(
                      context,
                      quizSummaryDetailsData.quizSummaryDetailsModel
                          .quizData.data[i], i,quizSummaryDetailsData
                      .quizSummaryDetailsModel.quizData.data.length,
                    dark: dark,),
              ],
            ),
          ),
        ),
      )
          :const SizedBox(),
    );
  }

  Widget _buildQuizQuestion
      (BuildContext context, Datum questionData, int index,int length,
      {required bool dark,}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${index + 1}. ${AppHelpers.removeHtmlTags(questionData.question)}',
          style: subtitle3.copyWith(color: dark
              ? Colors.white : silverChalice.shade900,),
        ),
        const SizedBox(height: 12),
        for (int j = 0; j < questionData.options.length; j++)
          _buildQuizOption(context,questionData, j),
        const SizedBox(height: 16),
        if(index+1!=length)Divider(color: dark
            ? const Color(0xff222223):silverChalice.shade100,),
      ],
    );
  }

  Widget _buildQuizOption(BuildContext context,
      Datum questionData, int optionIndex,) {
    final option = questionData.options[optionIndex];
    final hasSubmittedAnswer = questionData.submittedAnswer != null;
    final isOptionCorrect = questionData.answer.contains(option.id);
    final isOptionSubmitted = questionData
        .submittedAnswer?.contains(option.id) ?? false;

    final isSubmittedCorrect = hasSubmittedAnswer &&
        questionData.answer.length == questionData.submittedAnswer!.length &&
        questionData.answer.every((element) =>
            questionData.submittedAnswer!.contains(element),) &&
        questionData.submittedAnswer!.every((element) =>
            questionData.answer.contains(element),);

    final alphabetIndex = String.fromCharCode(65  + optionIndex);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizOption(
          selectedIcon: Icon(
            isOptionSubmitted
                ? (isOptionCorrect ? Icons.check : Icons.close)
                : Icons.circle_outlined,
            color: isOptionSubmitted
                ? (isOptionCorrect ? Colors.green : Colors.red)
                : Colors.grey,
            size: 20,
          ),
          selectedColor: isOptionSubmitted
              ? (isOptionCorrect
              ? const Color(0xff1CCF49) : const Color(0xffEE2301))
              : Colors.grey,
          selectedBgColor: isOptionSubmitted
              ? (isOptionCorrect ? Colors.greenAccent : Colors.redAccent)
              : Colors.transparent,
          label: '$alphabetIndex .',
          text: option.option,
          isSelected: isOptionSubmitted,
          onTap: () {
            // Handle option tap if required
          },
        ),
        const SizedBox(height: 10),
        if (optionIndex == questionData.options.length - 1)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isSubmittedCorrect
                    ? 'Your answer is correct'
                    : hasSubmittedAnswer
                    ? 'Your answer is incorrect'
                    : 'No answer submitted',
                style: subtitle2.copyWith(
                  color: isSubmittedCorrect
                      ? Colors.green
                      : hasSubmittedAnswer
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
              if (!isSubmittedCorrect && hasSubmittedAnswer)
                Wrap(
                  spacing: 4,
                  runSpacing: 8,
                  children: [
                    Text(
                      'The correct answers are',
                      style: subtitle2.copyWith(color: const Color(0xffD3D3D3)),
                    ),
                    ...questionData.answer.map((correctId) {
                      final correctOptionIndex = questionData.options
                          .indexWhere((opt) => opt.id == correctId,);
                      final alphabetIndex = String
                          .fromCharCode(65 + correctOptionIndex);
                      return Text(
                        alphabetIndex,
                        style: subtitle2.copyWith(
                          color: const Color(0xffD3D3D3),),
                      );
                    }),
                  ],
                ),
            ],
          ),
      ],
    );
  }
}
