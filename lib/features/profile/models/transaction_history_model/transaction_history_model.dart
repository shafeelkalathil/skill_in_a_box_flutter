import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_history_model.g.dart';

@JsonSerializable()
class TransactionHistory {
  TransactionHistory({this.transaction});

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);

  List<Transaction>? transaction;

  Map<String, dynamic> toJson() => _$TransactionHistoryToJson(this);
}

@JsonSerializable()
class Transaction {
  Transaction(
      {this.id,
      this.paymentMethod,
      this.paymentDate,
      this.amount,
      this.courseDetails,});

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  String? paymentMethod;
  String? paymentDate;
  int? amount;
  CourseDetails? courseDetails;

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

@JsonSerializable()
class CourseDetails {
  CourseDetails({this.id, this.title});

  factory CourseDetails.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsFromJson(json);
  @JsonKey(name: '_id')
  String? id;
  String? title;

  Map<String, dynamic> toJson() => _$CourseDetailsToJson(this);
}
