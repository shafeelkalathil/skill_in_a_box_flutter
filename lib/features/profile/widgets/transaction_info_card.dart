import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/string_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/formatters/date_formatter.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/transaction_history_model/transaction_history_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/transaction_history_view_model/transaction_history_state.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/transaction_history_view_model/transaction_history_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/status_badge.dart';

class TransactionInfoCard extends ConsumerWidget {
  const TransactionInfoCard({
    this.transaction,
    super.key,
  });
  final Transaction? transaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(transactionHistoryViewModelProvider);
    final dark = AppHelpers.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.06,
        vertical: context.screenWidth * 0.02,
      ),
      child: (state is TransactionHistoryLoading)
          ? ShimmerCard(
              width: context.screenWidth,
              height: context.screenHeight * 0.1,
              borderRadius: 16,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatusBadge(
                      bgColor: orange.withOpacity(0.1),
                      color: orange,
                      value: 'Payment status',
                    ),
                    Text(
                      DateFormatter.formatISOToCustomDate(
                          transaction?.paymentDate ?? '',),
                      style: heading4.copyWith(
                        color: dark
                            ? const Color(0xffD3D3D3):silverChalice.shade700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  transaction?.courseDetails?.title ?? '_',
                  style: heading3.copyWith(
                    color: dark ? Colors.white :silverChalice.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transaction?.paymentMethod?.toTitleCaseFromSnakeCase() ??
                          '_',
                      style: heading4.copyWith(color: dark
                          ? const Color(0xffD3D3D3):silverChalice.shade700,),
                    ),
                    Text(
                      '₹ ${transaction?.amount}',
                      style: heading3.copyWith(
                        color: orange.shade500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
