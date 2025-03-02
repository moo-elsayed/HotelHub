// To parse this JSON data, do
//
//     final registerInput = registerInputFromJson(jsonString);

import 'dart:convert';

RegisterInput registerInputFromJson(String str) =>
    RegisterInput.fromJson(json.decode(str));

String registerInputToJson(RegisterInput data) => json.encode(data.toJson());

class RegisterInput {
  String firstName;
  String lastName;
  String username;
  String email;
  String password;

  RegisterInput({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
  });

  factory RegisterInput.fromJson(Map<String, dynamic> json) => RegisterInput(
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
        "password": password,
      };
}
