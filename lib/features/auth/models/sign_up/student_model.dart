
class StudentModel {

  StudentModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.password,
    required this.gender,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    firstName: json['firstName'].toString(),
    lastName: json['lastName'].toString(),
    email: json['email'].toString(),
    phoneNumber: json['phoneNumber'].toString(),
    country: json['country'].toString(),
    password: json['password'].toString(),
    gender: json['gender'].toString(),
  );
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String country;
  String password;
  String gender;

  StudentModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? country,
    String? password,
    String? gender,
  }) =>
      StudentModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        country: country ?? this.country,
        password: password ?? this.password,
        gender: gender ?? this.gender,
      );

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phoneNumber': phoneNumber,
    'country': country,
    'password': password,
    'gender': gender,
  };
}
