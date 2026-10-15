import 'package:freezed_annotation/freezed_annotation.dart';
part 'kit_model.g.dart';
@JsonSerializable()
class KitModel {

  KitModel({
    required this.kit,
  });

  factory KitModel.fromJson(Map<String, dynamic> json) =>
      _$KitModelFromJson(json);
  Kit kit;

  KitModel copyWith({
    Kit? kit,
  }) =>
      KitModel(
        kit: kit ?? this.kit,
      );

  Map<String, dynamic> toJson() => _$KitModelToJson(this);
}

@JsonSerializable()
class Kit {

  Kit({
    required this.name,
    required this.items,
    required this.status,
    required this.machine,
  });

  factory Kit.fromJson(Map<String, dynamic> json) => _$KitFromJson(json);
  String name;
  List<Item> items;
  String status;
  Machine machine;

  Kit copyWith({
    String? name,
    List<Item>? items,
    String? status,
    Machine? machine,
  }) =>
      Kit(
        name: name ?? this.name,
        items: items ?? this.items,
        status: status ?? this.status,
        machine: machine ?? this.machine,
      );

  Map<String, dynamic> toJson() => _$KitToJson(this);
}

@JsonSerializable()
class Item {

  Item({
    required this.name,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  String name;
  int quantity;

  Item copyWith({
    String? name,
    int? quantity,
  }) =>
      Item(
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
      );

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Machine {

  Machine({
    required this.quantity,
  });

  factory Machine.fromJson(Map<String, dynamic> json) => _$MachineFromJson(json);
  int quantity;

  Machine copyWith({
    int? quantity,
  }) =>
      Machine(
        quantity: quantity ?? this.quantity,
      );

  Map<String, dynamic> toJson() => _$MachineToJson(this);
}
