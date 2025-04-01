// To parse this JSON data, do
//
//     final addCityInput = addCityInputFromJson(jsonString);

import 'dart:convert';

AddCityInput addCityInputFromJson(String str) =>
    AddCityInput.fromJson(json.decode(str));

String addCityInputToJson(AddCityInput data) => json.encode(data.toJson());

class AddCityInput {
  String name;
  String postalCode;

  AddCityInput({
    required this.name,
    required this.postalCode,
  });

  factory AddCityInput.fromJson(Map<String, dynamic> json) => AddCityInput(
        name: json["name"],
        postalCode: json["postalCode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "postalCode": postalCode,
      };
}
