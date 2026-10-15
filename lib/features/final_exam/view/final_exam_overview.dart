import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/exam_submission_model/exam_submission_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/widgets/quiz_options.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';


@RoutePage()
class FinalExamOverviewScreen extends StatelessWidget {
  const FinalExamOverviewScreen({required this.examSubmissionData, super.key});
  final ExamSubmissionModel examSubmissionData;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Final Exam - '
          '${examSubmissionData.exam.submittedTime}',),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: SingleChildScrollView(
            child: Column(
            children: [
              RoundedContainer(
            widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exam Overview',
                  style: heading3.copyWith(color: dark
                      ?Colors.white : silverChalice.shade900,),
                ),
                const SizedBox(height: 30),
                _buildExamDetailRow(
                  context,
                  title: 'Due Date',
                  value: examSubmissionData.exam.submittedTime.substring(5,16),
                  icon: Image.asset(
                    Assets.images.calenderImage.path,
                    width: 24,
                  ),
                  dark: dark,
                ),
                const SizedBox(height: 10),
                _buildExamDetailRow(
                  context,
                  title: 'Time Taken',
                  value: examSubmissionData.exam.timeTaken.toString(),
                  icon: SvgPicture.asset(Assets.icons.quizTimer),
                  dark: dark,
                ),
                const SizedBox(height: 10),
                _buildExamDetailRow(
                  context,
                  title: 'Total Marks',
                  value: examSubmissionData.exam.totalMark.toString(),
                  icon: SvgPicture.asset(Assets.icons.trophy),
                  dark: dark,
                ),
                const SizedBox(height: 10),
                _buildExamDetailRow(
                  context,
                  title: 'Marks Obtained',
                  value: examSubmissionData.exam.obtainedMark.toString(),
                  icon: Image.asset(
                    Assets.images.aPlusBadge.path,
                    width: 24,
                  ),
                  dark: dark,
                ),
              ],
            ),
          ),
              const SizedBox(height: 20,),
              for (int i = 0; i < examSubmissionData.exam.result.length; i++)
                _buildQuizQuestion(
                  context,
                  examSubmissionData.exam.result[i], i,
                  examSubmissionData.exam.result.length,
                  dark: dark,),
            ],
                  ),
          ),
        ),),
    );
  }

  Widget _buildQuizQuestion
      (BuildContext context, Result questionData, int index,int length,
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
        if(questionData.type == 'text')
          RoundedContainer(widget: Text(questionData.submittedAnswer![0],
            style: subtitle2.copyWith(
                color: dark
                    ? const Color(0xffD3D3D3): silverChalice.shade900,),),),
        if(questionData.type != 'text')
          for (int j = 0; j < questionData.options.length; j++)
          _buildQuizOption(context,questionData, j,dark: dark),
        const SizedBox(height: 16),
        if(index+1!=length)Divider(color: dark
            ? const Color(0xff222223):silverChalice.shade100,),
      ],
    );
  }

  Widget _buildQuizOption(BuildContext context,
      Result questionData, int optionIndex,{required bool dark,}) {
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
              if (!isSubmittedCorrect &&
                  hasSubmittedAnswer &&
                  questionData.type != 'text')
                Wrap(
                  spacing: 4,
                  runSpacing: 8,
                  children: [
                    Text(
                      'The correct answers are',
                      style: subtitle2.copyWith(color: dark
                          ? const Color(0xffD3D3D3) : silverChalice.shade700,),
                    ),
                    ...questionData.answer.map((correctId) {
                      final correctOptionIndex = questionData.options
                          .indexWhere((opt) => opt.id == correctId,);
                      final alphabetIndex = String
                          .fromCharCode(65 + correctOptionIndex);
                      return Text(
                        alphabetIndex,
                        style: subtitle2.copyWith(
                            color: dark
                                ? const Color(0xffD3D3D3) : silverChalice.shade700,),
                      );
                    }),
                  ],
                ),
            ],
          ),
      ],
    );
  }

  Widget _buildExamDetailRow(BuildContext context,
      {required String title,required String value, required Widget icon,
        required bool dark,}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.screenWidth * 0.35,
          child: Text(
            title,
            style: subtitle3.copyWith(color: dark
                ? const Color(0xffD3D3D3) : silverChalice.shade900,),
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.4,
          child: Row(
            children: [
              icon,
              const SizedBox(width: 10),
              Text(
                value,
                style: subtitle3.copyWith(color: dark
                    ? const Color(0xffD3D3D3) : silverChalice.shade900,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
