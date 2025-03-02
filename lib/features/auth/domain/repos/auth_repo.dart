import 'package:dartz/dartz.dart';
import 'package:hotel_hub/features/auth/data/models/login_input.dart';
import 'package:hotel_hub/features/auth/data/models/login_output.dart';
import 'package:hotel_hub/features/auth/data/models/register_output.dart';

import '../../../../core/utils/failures.dart';
import '../../data/models/register_input.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegisterOutput>> register(
      {required RegisterInput registerInput});

  Future<Either<Failure, LoginOutput>> login({required LoginInput loginInput});
}
