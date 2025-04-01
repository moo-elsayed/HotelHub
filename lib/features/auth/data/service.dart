import 'package:dio/dio.dart';
import 'package:hotel_hub/features/auth/data/models/login_input.dart';
import 'package:hotel_hub/features/auth/data/models/login_output.dart';
import 'package:hotel_hub/features/auth/data/models/register_output.dart';
import '../../../constants.dart';
import 'models/register_input.dart';

class AuthService {
  final Dio dio = Dio();

  Future<RegisterOutput> register(
      {required RegisterInput registerInput}) async {
    final response =
        await dio.post('$KBaseUrl/Auth/register', data: registerInput.toJson());
    return RegisterOutput.fromJson(response.data);
  }

  Future<LoginOutput> login({required LoginInput loginInput}) async {
    final response =
        await dio.post('$KBaseUrl/Auth/login', data: loginInput.toJson());
    return LoginOutput.fromJson(response.data);
  }
}
