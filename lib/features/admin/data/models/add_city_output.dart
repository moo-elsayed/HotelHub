// To parse this JSON data, do
//
//     final addCityOutput = addCityOutputFromJson(jsonString);

import 'dart:convert';

AddCityOutput addCityOutputFromJson(String str) =>
    AddCityOutput.fromJson(json.decode(str));

String addCityOutputToJson(AddCityOutput data) => json.encode(data.toJson());

class AddCityOutput {
  int statusCode;
  bool isSuccess;
  dynamic errorMessages;
  Result result;

  AddCityOutput({
    required this.statusCode,
    required this.isSuccess,
    required this.errorMessages,
    required this.result,
  });

  factory AddCityOutput.fromJson(Map<String, dynamic> json) => AddCityOutput(
        statusCode: json["statusCode"],
        isSuccess: json["isSuccess"],
        errorMessages: json["errorMessages"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "isSuccess": isSuccess,
        "errorMessages": errorMessages,
        "result": result.toJson(),
      };
}

class Result {
  dynamic urlHelper;
  String routeName;
  RouteValues routeValues;
  Value value;
  List<dynamic> formatters;
  List<dynamic> contentTypes;
  dynamic declaredType;
  int statusCode;

  Result({
    required this.urlHelper,
    required this.routeName,
    required this.routeValues,
    required this.value,
    required this.formatters,
    required this.contentTypes,
    required this.declaredType,
    required this.statusCode,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        urlHelper: json["urlHelper"],
        routeName: json["routeName"],
        routeValues: RouteValues.fromJson(json["routeValues"]),
        value: Value.fromJson(json["value"]),
        formatters: List<dynamic>.from(json["formatters"].map((x) => x)),
        contentTypes: List<dynamic>.from(json["contentTypes"].map((x) => x)),
        declaredType: json["declaredType"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "urlHelper": urlHelper,
        "routeName": routeName,
        "routeValues": routeValues.toJson(),
        "value": value.toJson(),
        "formatters": List<dynamic>.from(formatters.map((x) => x)),
        "contentTypes": List<dynamic>.from(contentTypes.map((x) => x)),
        "declaredType": declaredType,
        "statusCode": statusCode,
      };
}

class RouteValues {
  int id;

  RouteValues({
    required this.id,
  });

  factory RouteValues.fromJson(Map<String, dynamic> json) => RouteValues(
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
      };
}

class Value {
  int id;
  String name;
  String postalCode;
  dynamic hotels;

  Value({
    required this.id,
    required this.name,
    required this.postalCode,
    required this.hotels,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json["id"],
        name: json["name"],
        postalCode: json["postalCode"],
        hotels: json["hotels"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "postalCode": postalCode,
        "hotels": hotels,
      };
}
