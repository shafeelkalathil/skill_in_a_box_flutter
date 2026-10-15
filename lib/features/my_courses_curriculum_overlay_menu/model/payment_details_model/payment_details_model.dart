
import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_details_model.g.dart';
@JsonSerializable()
class PaymentDetailsModel {

  PaymentDetailsModel({
    required this.payment,
  });

  factory PaymentDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsModelFromJson(json);
  List<Payment> payment;

  PaymentDetailsModel copyWith({
    List<Payment>? payment,
  }) =>
      PaymentDetailsModel(
        payment: payment ?? this.payment,
      );

  Map<String, dynamic> toJson() => _$PaymentDetailsModelToJson(this);
}

@JsonSerializable()
class Payment {

  Payment({
    required this.type,
    this.courseFee,
    this.registrationAmount,
    this.discount,
    this.installments,
    this.document,
    this.amount,
  });

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
  String type;
  int? courseFee;
  int? registrationAmount;
  int? discount;
  Installments? installments;
  List<String>? document;
  int? amount;

  Payment copyWith({
    String? type,
    int? courseFee,
    int? registrationAmount,
    int? discount,
    Installments? installments,
    List<String>? document,
    int? amount,
  }) =>
      Payment(
        type: type ?? this.type,
        courseFee: courseFee ?? this.courseFee,
        registrationAmount: registrationAmount ?? this.registrationAmount,
        discount: discount ?? this.discount,
        installments: installments ?? this.installments,
        document: document ?? this.document,
        amount: amount ?? this.amount,
      );

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}

@JsonSerializable()
class Installments {

  Installments({
    required this.installments,
  });

  factory Installments.fromJson(Map<String, dynamic> json) =>
      _$InstallmentsFromJson(json);
  List<Installment> installments;

  Installments copyWith({
    List<Installment>? installments,
  }) =>
      Installments(
        installments: installments ?? this.installments,
      );

  Map<String, dynamic> toJson() => _$InstallmentsToJson(this);
}


@JsonSerializable()
class Installment {

  Installment({
    required this.id,
    required this.isPaid,
    required this.name,
    required this.amount,
  });

  factory Installment.fromJson(Map<String, dynamic> json) =>
      _$InstallmentFromJson(json);
  @JsonKey(name: '_id')
  String id;
  bool isPaid;
  String name;
  int amount;

  Installment copyWith({
    String? id,
    bool? isPaid,
    String? name,
    int? amount,
  }) =>
      Installment(
        id: id ?? this.id,
        isPaid: isPaid ?? this.isPaid,
        name: name ?? this.name,
        amount: amount ?? this.amount,
      );

  Map<String, dynamic> toJson() => _$InstallmentToJson(this);
}
