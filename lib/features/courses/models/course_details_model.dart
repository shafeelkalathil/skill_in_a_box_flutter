
class CategoryDetailsModel {

  CategoryDetailsModel({
    required this.id,
    required this.name,
    required this.type,
  });

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) =>
      CategoryDetailsModel(
    id: json['_id'].toString(),
    name: json['name'].toString(),
    type: json['type'].toString(),
  );
  String id;
  String name;
  String type;

  CategoryDetailsModel copyWith({
    String? id,
    String? name,
    String? type,
  }) =>
      CategoryDetailsModel(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
      );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'type': type,
  };
}
