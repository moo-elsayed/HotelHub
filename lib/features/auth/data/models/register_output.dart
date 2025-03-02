// To parse this JSON data, do
//
//     final registerOutput = registerOutputFromJson(jsonString);

import 'dart:convert';

RegisterOutput registerOutputFromJson(String str) =>
    RegisterOutput.fromJson(json.decode(str));

String registerOutputToJson(RegisterOutput data) => json.encode(data.toJson());

class RegisterOutput {
  String token;
  DateTime expires;

  RegisterOutput({
    required this.token,
    required this.expires,
  });

  factory RegisterOutput.fromJson(Map<String, dynamic> json) => RegisterOutput(
        token: json["token"],
        expires: DateTime.parse(json["expires"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expires": expires.toIso8601String(),
      };
}
