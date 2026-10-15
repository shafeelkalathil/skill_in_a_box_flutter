

class ValidityModel {

  ValidityModel({
    required this.numberOf,
    required this.type,
  });

  factory ValidityModel.fromJson(Map<String, dynamic> json) => ValidityModel(
    numberOf: (json['numberOf'] is int)
        ? json['numberOf'] as int
        : int.tryParse(json['numberOf'].toString()) ?? 0,
    type: json['type'].toString(),
  );
  int numberOf;
  String type;

  ValidityModel copyWith({
    int? numberOf,
    String? type,
  }) =>
      ValidityModel(
        numberOf: numberOf ?? this.numberOf,
        type: type ?? this.type,
      );

  Map<String, dynamic> toJson() => {
    'numberOf': numberOf,
    'type': type,
  };
}
