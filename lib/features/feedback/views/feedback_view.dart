import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/feedback/models/feedback_form/feedback_form_model.dart';
import 'package:skill_in_a_box_flutter/features/feedback/view_models/feedback_form/feedback_form_view_model.dart';
import 'package:skill_in_a_box_flutter/features/feedback/view_models/feedback_response/feedback_response_view_model.dart';
import 'package:skill_in_a_box_flutter/features/feedback/widgets/feedback_form_state_widgets/feedback_not_available.dart';
import 'package:skill_in_a_box_flutter/features/feedback/widgets/mcq_card.dart';
import 'package:skill_in_a_box_flutter/features/feedback/widgets/rating_card.dart';
import 'package:skill_in_a_box_flutter/features/feedback/widgets/short_answer_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

final isSubmitButtonClickedProvider = StateProvider<bool>((ref) => false);

@RoutePage()
class FeedBackPage extends ConsumerWidget {
  const FeedBackPage({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackResponseState = ref.watch(feedbackResponseViewmodelProvider);
    final buttonState = ref.watch(isSubmitButtonClickedProvider);
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? const Color(0xff222223) : const Color(0xfff9fbfd),
      appBar: CustomAppBar(
        title: title,
        backgroundColor:
            dark ? const Color(0xff222223) : const Color(0xfff9fbfd),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenPadding),
          child: Column(
            children: [
              McqCard(
                isMultiSelect: false,
                content: Content(
                  question: 'What is your name?',
                  id: '1',
                  isMandatory: true,
                  options: ['Ajith', 'Fibin', 'Siju', 'Arjun'],
                ),
              ),
              ShortAnswerCard(
                content: Content(
                  question: 'Write about course',
                  id: '5',
                  isMandatory: true,
                ),
              ),
              McqCard(
                isMultiSelect: true,
                content: Content(
                  question: 'What is your name?',
                  id: '2',
                  isMandatory: true,
                  options: ['Mansoor', 'Das', 'Kichu', 'Shan'],
                ),
              ),
              RatingCard(
                content: Content(
                  question: 'Rate this course',
                  id: '3',
                  isMandatory: true,
                  scaleCount: 5,
                ),
              ),
              McqCard(
                isMultiSelect: false,
                content: Content(
                  question: 'What is your name?',
                  isMandatory: false,
                  id: '4',
                  options: ['Ram', 'Esthapan', 'Boby', 'Singh'],
                ),
              ),
              TextButton(
                  onPressed: () {
                    ref.read(isSubmitButtonClickedProvider.notifier).state =
                        true;
                    if (feedbackResponseState.stateSubmissionList != null) {
                      feedbackResponseState.stateSubmissionList!
                          .forEach((submission) {
                        print('XXXXXXX');
                        print('QuestionId: ${submission.questionId}');
                        print(
                            'Submitted Answers: ${submission.submittedAnswer}');
                      });
                    }
                  },
                  child: Text('submit'))
            ],
          ),
        ),
      ),
    );
  }
}
