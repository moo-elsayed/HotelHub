// To parse this JSON data, do
//
//     final deleteCityOutput = deleteCityOutputFromJson(jsonString);

import 'dart:convert';

ApiResponse deleteCityOutputFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String deleteCityOutputToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  int statusCode;
  bool isSuccess;
  dynamic errorMessages;
  dynamic result;

  ApiResponse({
    required this.statusCode,
    required this.isSuccess,
    required this.errorMessages,
    required this.result,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        statusCode: json["statusCode"],
        isSuccess: json["isSuccess"],
        errorMessages: json["errorMessages"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "isSuccess": isSuccess,
        "errorMessages": errorMessages,
        "result": result,
      };
}
