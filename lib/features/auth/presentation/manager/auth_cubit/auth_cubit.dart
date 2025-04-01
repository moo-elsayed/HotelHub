import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_hub/features/auth/data/models/register_input.dart';
import 'package:hotel_hub/features/auth/domain/repos/auth_repo.dart';
import '../../../data/models/login_input.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  Future login({required LoginInput loginInput}) async {
    if (loginInput.email.isEmpty || loginInput.password.isEmpty) {
      emit(LoginFailure(errorMessage: 'empty field!'));
      return;
    }
    emit(LoginLoading());
    var result = await authRepo.login(loginInput: loginInput);
    result.fold((failure) => emit(LoginFailure(errorMessage: failure)),
        (loginOutput) => emit(LoginSuccess(loginOutput: loginOutput)));
  }

  Future register({required RegisterInput registerInput}) async {
    if (registerInput.username.isEmpty ||
        registerInput.email.isEmpty ||
        registerInput.password.isEmpty ||
        registerInput.firstName.isEmpty ||
        registerInput.lastName.isEmpty) {
      emit(RegisterFailure(errorMessage: 'empty field!'));
      return;
    }

    emit(RegisterLoading());
    var result = await authRepo.register(registerInput: registerInput);
    result.fold(
        (failure) => emit(RegisterFailure(errorMessage: failure)),
        (registerOutput) =>
            emit(RegisterSuccess(registerOutput: registerOutput)));
  }
}
