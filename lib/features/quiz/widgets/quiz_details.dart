import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_overview/quiz_overview_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/widgets/quiz_details_info.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';

class QuizDetails extends StatelessWidget {
  const QuizDetails({
    required this.quizOverviewModel, super.key,
  });
  final QuizOverviewModel quizOverviewModel;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return RoundedContainer(
      widget: Column(
        children: [
          Text(
            'Quiz Details',
            style: heading2.copyWith(color: dark
                ? Colors.white :silverChalice.shade700,),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuizInfoColumn(
                width: context.screenWidth * 0.35,
                items: [
                  QuizInfoItem(title: 'Total Questions',
                      value: quizOverviewModel
                          .quizData.totalQuestions.toString(),),
                  QuizInfoItem(title: 'Passing Criteria',
                    value: quizOverviewModel.quizData.passMark.toString(),),
                ],
              ),
              QuizInfoColumn(
                width: context.screenWidth * 0.35,
                items: [
                  QuizInfoItem(title: 'Total Marks',
                    value: quizOverviewModel.quizData.totalMark.toString(),),
                  QuizInfoItem(title: 'Time',
                    value: quizOverviewModel.quizData.duration.toString(),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
