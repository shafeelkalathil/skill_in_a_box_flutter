
class StudentBaseModel {

  StudentBaseModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory StudentBaseModel.fromJson(Map<String, dynamic> json) =>
      StudentBaseModel(
        id: json['_id'].toString(),
        firstName: json['firstName'].toString(),
        lastName: json['lastName'].toString(),
        email: json['email'].toString(),
      );
  String id;
  String firstName;
  String lastName;
  String email;

  StudentBaseModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
  }) =>
      StudentBaseModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
  };
}
