import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class QuizInfoColumn extends StatelessWidget {

  const QuizInfoColumn({
    required this.width,
    required this.items,
    super.key,});
  final double width;
  final List<QuizInfoItem> items;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title, style: heading4.copyWith(
                  color: dark ? Colors.white :silverChalice.shade500,),),
              Text(
                item.value,
                style: subtitle4.copyWith(
                  fontSize: 16,
                  color: dark
                      ? (item.isCorrectAnswer
                      ? const Color(0xff39C261)
                      : item.isInCorrectAnswer
                      ? const Color(0xffF86961)
                      : Colors.white)
                      : silverChalice.shade700,
                ),
              ),
            ],
          ),
        ),)
            .toList(),
      ),
    );
  }
}

class QuizInfoItem {

  QuizInfoItem({
    required this.title,
    required this.value,
    this.isCorrectAnswer = false,
    this.isInCorrectAnswer = false,
  });
  final String title;
  final String value;
  final bool isCorrectAnswer;
  final bool isInCorrectAnswer;
}
