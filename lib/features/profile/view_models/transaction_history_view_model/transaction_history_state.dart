import 'package:skill_in_a_box_flutter/features/profile/models/transaction_history_model/transaction_history_model.dart';

abstract class TransactionHistorysState {
  TransactionHistorysState({this.transactionHistory});

  final TransactionHistory? transactionHistory;
}

class TransactionHistoryInitial implements TransactionHistorysState {
  @override
  TransactionHistory? get transactionHistory => null;
}

class TransactionHistoryLoading implements TransactionHistorysState {
  TransactionHistoryLoading();
  @override
  TransactionHistory? get transactionHistory => null;
}

class TransactionHistorySuccess implements TransactionHistorysState {
  TransactionHistorySuccess({this.transactionDetails});
  @override
  TransactionHistory? get transactionHistory => transactionDetails;
  final TransactionHistory? transactionDetails;
}

class TransactionHistoryFailed implements TransactionHistorysState {
  TransactionHistoryFailed({
    required this.errorMessage,
    this.transactionDetails,
  });
  @override
  TransactionHistory? get transactionHistory => transactionDetails;
  final TransactionHistory? transactionDetails;
  final String errorMessage;
}
