import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/profile/repositories/transaction_history_repository.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/transaction_history_view_model/transaction_history_state.dart';

final transactionHistoryViewModelProvider = StateNotifierProvider<
    TransactionHistoryViewModel, TransactionHistorysState>(
  (ref) => TransactionHistoryViewModel(
    ref.read(transactionHistoryRepositoryProvider),
  ),
);

class TransactionHistoryViewModel
    extends StateNotifier<TransactionHistorysState> {
  TransactionHistoryViewModel(this.transactionHistoryRepository)
      : super(TransactionHistoryInitial());

  final TransactionHistoryRepository transactionHistoryRepository;

  Future<void> fetchTransactionHistory() async {
    state = TransactionHistoryLoading();
    final response = await transactionHistoryRepository.getTransactionHistory();
    response.fold((errorMessage) {
      state = TransactionHistoryFailed(
        errorMessage: errorMessage,
        transactionDetails: state.transactionHistory,
      );
    }, (transactionHistory) {
      state = TransactionHistorySuccess(transactionDetails: transactionHistory);
    });
  }
}
