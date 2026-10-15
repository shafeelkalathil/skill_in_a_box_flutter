import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_overview/quiz_overview_state.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_overview/quiz_overview_view_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';
import 'package:skill_in_a_box_flutter/features/quiz/widgets/general_instruction.dart';
import 'package:skill_in_a_box_flutter/features/quiz/widgets/quiz_details.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

@RoutePage()
class QuizDetailsScreen extends ConsumerWidget {
  const QuizDetailsScreen({
    required this.quizBodyParams, super.key,
  });

  final QuizBodyParams quizBodyParams;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizOverviewData = ref.watch(quizOverviewViewModelNotifier);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Tools of Fashion'),
      body: quizOverviewData is GetQuizOverviewLoading
          ? Center(child: CircularProgressIndicator(color: orange.shade500,),)
          : quizOverviewData is GetQuizOverviewFailure
          ? Center(child: Text(quizOverviewData.message),)
          : quizOverviewData is GetQuizOverviewSuccess
          ? SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.06,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.03),
                QuizDetails(
                    quizOverviewModel: quizOverviewData.quizOverviewModel,),
                SizedBox(height: context.screenHeight * 0.03),
                const GeneralInstruction(),
                SizedBox(height: context.screenHeight * 0.03),
                Center(
                  child: SizedBox(
                    width: context.screenWidth * 0.5,
                    child: ElevatedButton(
                      onPressed: () async {
                        final result = await ref
                            .read(quizOverviewViewModelNotifier.notifier)
                            .startQuiz(quizSummaryParams: quizBodyParams);

                        result.fold((errorMessage) {
                          AppHelpers.showSnackBar
                            ('Failed to start quiz: $errorMessage',
                            context,);
                        }, (startQuizModel) {
                          AppHelpers.showSnackBar
                            ('Quiz started successfully!',
                            context,);
                          context.router.pushAndPopUntil(QuizQuestionRoute(
                            duration: quizOverviewData.quizOverviewModel
                                .quizData.duration,
                            quizBodyParams: quizBodyParams,
                          ),
                            predicate: (route) => false,);
                        },
                        );
                      },
                      child: const Text('Start Quiz'),
                    ),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.03),
              ],
            ),
          ),
        ),
      )
          : const SizedBox(),
    );
  }
}
