// import 'dart:developer';
//
// import 'package:dio/dio.dart';
//
// class ApiService {
//   final Dio dio = Dio();
//   final String baseUrl = 'https://hotelapi.runasp.net/api/';
//   final _defaultHeaders = {
//     'Authorization': 'Bearer ${ApiKeys.apiKey}', // Bearer Token
//     'X-API-Key': ApiKeys.apiKey, // Custom header
//   };
//
//   Future<Response> get({
//     required String url,
//   }) async {
//     var response = await dio.get(
//       url,
//       options: Options(headers: _defaultHeaders),
//     );
//     return response;
//   }
// }