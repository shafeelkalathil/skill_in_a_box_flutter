import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/enrolled_courses_view_model/enrolled_courses_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/transaction_history_view_model/transaction_history_state.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/transaction_history_view_model/transaction_history_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/widgets/transaction_info_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

@RoutePage()
class TransactionHistoryScreen extends ConsumerStatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  ConsumerState<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState
    extends ConsumerState<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(transactionHistoryViewModelProvider);
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Transaction History'),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (state is TransactionHistoryFailed) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: context.screenWidth * 0.7,
                      child: Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: subtitle1.copyWith(
                          color: silverChalice.shade900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(enrolledCoursesViewModelProvider.notifier)
                            .fetchEnrolledCourses();
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            } else if (state is TransactionHistorySuccess &&
                state.transactionHistory?.transaction == null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    'No Transactions Completed',
                    style: subtitle1.copyWith(color: silverChalice.shade900),
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: context.screenHeight * 0.01,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TransactionInfoCard(
                          transaction:
                              state.transactionHistory?.transaction?[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(color: dark
                            ? const Color(0xff2C2C2E):const Color(0xffE7E7E7),);
                      },
                      itemCount:
                          state.transactionHistory?.transaction?.length ?? 6,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.06,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
