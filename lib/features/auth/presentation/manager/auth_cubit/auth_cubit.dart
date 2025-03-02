import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_hub/features/auth/data/models/register_input.dart';
import 'package:hotel_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:hotel_hub/features/auth/domain/repos/auth_repo_imp.dart';

import '../../../data/models/login_input.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  Future login({required LoginInput loginInput}) async {
    emit(LoginLoading());
    var result = await authRepo.login(loginInput: loginInput);
    result.fold(
        (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
        (loginOutput) => emit(LoginSuccess(loginOutput: loginOutput)));
  }

  Future register({required RegisterInput registerInput}) async {
    emit(RegisterLoading());
    var result = await authRepo.register(registerInput: registerInput);
    result.fold(
        (failure) => emit(RegisterFailure(errorMessage: failure.errorMessage)),
        (registerOutput) =>
            emit(RegisterSuccess(registerOutput: registerOutput)));
  }
}
