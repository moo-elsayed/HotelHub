import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotel_hub/constants.dart';
import 'package:hotel_hub/features/auth/data/models/login_input.dart';
import 'package:hotel_hub/features/auth/data/models/login_output.dart';
import 'package:hotel_hub/features/auth/data/models/register_input.dart';
import 'package:hotel_hub/features/auth/data/models/register_output.dart';
import 'package:hotel_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final Dio dio;

  AuthRepoImp({required this.dio});

  @override
  Future<Either<String, LoginOutput>> login(
      {required LoginInput loginInput}) async {
    try {
      var response =
          await dio.post('$KBaseUrl/Auth/login', data: loginInput.toJson());

      LoginOutput loginOutput = LoginOutput.fromJson(response.data);
      return right(loginOutput);
    } catch (e) {
      // log(e.toString());
      // return left(ServerFailure(errorMessage: e.toString()));

      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          var errorData = e.response!.data;
          // if (errorData is Map<String, dynamic> &&
          //     errorData.containsKey('errors')) {
          //   List<String> errorMessages = (errorData['errors'] as List<dynamic>)
          //       .map((e) => e.toString())
          //       .toList();
          //   return left(ServerFailure(errorMessage: errorMessages.join("\n")));
          // }
          // else if (errorData is String) {
          //   return left(ServerFailure(errorMessage: errorData));
          // }
          log(errorData);
          errorData = errorData
              .toString()
              .substring(0, errorData.toString().length - 1);
          log(errorData);
          errorData = errorData.toString().replaceAll(',', '\n');
          log(errorData);
          return left(errorData);
        }
      }
      // return left(ServerFailure(errorMessage: e.toString()));
      log(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, RegisterOutput>> register(
      {required RegisterInput registerInput}) async {
    try {
      var response = await dio.post('$KBaseUrl/Auth/register',
          data: registerInput.toJson());

      RegisterOutput registerOutput = RegisterOutput.fromJson(response.data);
      return right(registerOutput);
    } catch (e) {
      //log(e.toString());

      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          var errorData = e.response!.data;
          // if (errorData is Map<String, dynamic> &&
          //     errorData.containsKey('errors')) {
          //   List<String> errorMessages = (errorData['errors'] as List<dynamic>)
          //       .map((e) => e.toString())
          //       .toList();
          //   return left(ServerFailure(errorMessage: errorMessages.join("\n")));
          // }
          // else if (errorData is String) {
          //   return left(ServerFailure(errorMessage: errorData));
          // }
          log(errorData);
          errorData = errorData
              .toString()
              .substring(0, errorData.toString().length - 1);
          log(errorData);
          errorData = errorData.toString().replaceAll(',', '\n');
          log(errorData);
          return left(errorData);
        }
      }
      // return left(ServerFailure(errorMessage: e.toString()));
      log(e.toString());
      return left(e.toString());
    }
  }
}
