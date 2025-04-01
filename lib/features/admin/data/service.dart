import 'package:dio/dio.dart';
import 'package:hotel_hub/constants.dart';
import 'package:hotel_hub/features/admin/data/models/add_city_input.dart';
import 'package:hotel_hub/features/admin/data/models/add_city_output.dart';
import 'package:hotel_hub/features/admin/data/models/api_response.dart';
import 'package:hotel_hub/features/admin/data/models/edit_city_input.dart';
import 'package:hotel_hub/features/admin/data/models/patch_city.dart';

class AdminService {
  final Dio dio = Dio();

  Future<AddCityOutput> addCity({required AddCityInput addCityInput}) async {
    final response =
        await dio.post('$KBaseUrl/Cities', data: addCityInput.toJson());
    return AddCityOutput.fromJson(response.data);
  }

  Future<ApiResponse> deleteCity({required int id}) async {
    final response = await dio.post('$KBaseUrl/Cities/$id');
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> editCity({required EditCity editCity}) async {
    final response =
        await dio.post('$KBaseUrl/Cities', data: editCity.toJson());
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> patchCity({required PatchCity patchCity}) async {
    final response =
        await dio.post('$KBaseUrl/Cities', data: patchCity.toJson());
    return ApiResponse.fromJson(response.data);
  }
}