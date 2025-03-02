// To parse this JSON data, do
//
//     final loginOutput = loginOutputFromJson(jsonString);

import 'dart:convert';

LoginOutput loginOutputFromJson(String str) =>
    LoginOutput.fromJson(json.decode(str));

String loginOutputToJson(LoginOutput data) => json.encode(data.toJson());

class LoginOutput {
  dynamic message;
  bool isAuthenticated;
  String email;
  String username;
  List<String> roles;
  String token;
  DateTime expiresOn;

  LoginOutput({
    required this.message,
    required this.isAuthenticated,
    required this.email,
    required this.username,
    required this.roles,
    required this.token,
    required this.expiresOn,
  });

  factory LoginOutput.fromJson(Map<String, dynamic> json) => LoginOutput(
        message: json["message"],
        isAuthenticated: json["isAuthenticated"],
        email: json["email"],
        username: json["username"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        token: json["token"],
        expiresOn: DateTime.parse(json["expiresOn"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "isAuthenticated": isAuthenticated,
        "email": email,
        "username": username,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "token": token,
        "expiresOn": expiresOn.toIso8601String(),
      };
}
