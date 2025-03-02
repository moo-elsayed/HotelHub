import 'package:hotel_hub/features/auth/data/models/login_output.dart';
import 'package:hotel_hub/features/auth/data/models/register_output.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {
  final LoginOutput loginOutput;

  LoginSuccess({required this.loginOutput});
}

class LoginFailure extends AuthStates {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

class RegisterLoading extends AuthStates {}

class RegisterSuccess extends AuthStates {
  final RegisterOutput registerOutput;

  RegisterSuccess({required this.registerOutput});
}

class RegisterFailure extends AuthStates {
  final String errorMessage;

  RegisterFailure({required this.errorMessage});
}

