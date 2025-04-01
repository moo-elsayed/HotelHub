// To parse this JSON data, do
//
//     final patchCityInput = patchCityInputFromJson(jsonString);

import 'dart:convert';

List<PatchCity> patchCityInputFromJson(String str) =>
    List<PatchCity>.from(
        json.decode(str).map((x) => PatchCity.fromJson(x)));

String patchCityInputToJson(List<PatchCity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatchCity {
  String path;
  String op;
  String value;

  PatchCity({
    required this.path,
    required this.op,
    required this.value,
  });

  factory PatchCity.fromJson(Map<String, dynamic> json) => PatchCity(
        path: json["path"],
        op: json["op"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "op": op,
        "value": value,
      };
}