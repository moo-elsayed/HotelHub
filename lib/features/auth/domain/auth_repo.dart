import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hotel_hub/features/auth/data/models/login_input.dart';
import 'package:hotel_hub/features/auth/data/models/login_output.dart';
import 'package:hotel_hub/features/auth/data/models/register_input.dart';
import 'package:hotel_hub/features/auth/data/models/register_output.dart';
import 'package:hotel_hub/features/auth/data/service.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  final AuthService authService = AuthService();

  Future<Either<String, LoginOutput>> login(
      {required LoginInput loginInput}) async {
    try {
      LoginOutput loginOutput = await authService.login(loginInput: loginInput);
      return right(loginOutput);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          var errorData = e.response!.data;
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
      log(e.toString());
      return left(e.toString());
    }
  }

  Future<Either<String, RegisterOutput>> register(
      {required RegisterInput registerInput}) async {
    try {
      RegisterOutput registerOutput =
          await authService.register(registerInput: registerInput);
      return right(registerOutput);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          var errorData = e.response!.data;
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
      log(e.toString());
      return left(e.toString());
    }
  }
}