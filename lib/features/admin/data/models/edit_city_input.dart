// To parse this JSON data, do
//
//     final editCityInput = editCityInputFromJson(jsonString);

import 'dart:convert';

EditCity editCityInputFromJson(String str) =>
    EditCity.fromJson(json.decode(str));

String editCityInputToJson(EditCity data) => json.encode(data.toJson());

class EditCity {
  int id;
  String name;
  String postalCode;

  EditCity({
    required this.id,
    required this.name,
    required this.postalCode,
  });

  factory EditCity.fromJson(Map<String, dynamic> json) => EditCity(
        id: json["id"],
        name: json["name"],
        postalCode: json["postalCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "postalCode": postalCode,
      };
}
