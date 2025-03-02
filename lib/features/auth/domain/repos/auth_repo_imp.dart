import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotel_hub/constants.dart';
import 'package:hotel_hub/core/utils/failures.dart';
import 'package:hotel_hub/features/auth/data/models/login_input.dart';
import 'package:hotel_hub/features/auth/data/models/login_output.dart';
import 'package:hotel_hub/features/auth/data/models/register_input.dart';
import 'package:hotel_hub/features/auth/data/models/register_output.dart';
import 'package:hotel_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final Dio dio;

  AuthRepoImp({required this.dio});

  @override
  Future<Either<Failure, LoginOutput>> login(
      {required LoginInput loginInput}) async {
    try {
      var response =
          await dio.post('$KBaseUrl/Auth/login', data: loginInput.toJson());

      LoginOutput loginOutput = LoginOutput.fromJson(response.data);
      return right(loginOutput);
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterOutput>> register(
      {required RegisterInput registerInput}) async {
    try {
      var response = await dio.post('$KBaseUrl/Auth/register',
          data: registerInput.toJson());

      RegisterOutput registerOutput = RegisterOutput.fromJson(response.data);
      return right(registerOutput);
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
