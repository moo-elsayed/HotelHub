import 'package:dartz/dartz.dart';
import 'package:hotel_hub/features/admin/data/models/add_city_input.dart';
import 'package:hotel_hub/features/admin/data/models/add_city_output.dart';
import 'package:hotel_hub/features/admin/data/models/api_response.dart';
import 'package:hotel_hub/features/admin/data/models/edit_city_input.dart';
import 'package:hotel_hub/features/admin/data/models/patch_city.dart';
import 'package:hotel_hub/features/admin/data/service.dart';

class AdminRepo {
  final AdminService adminService = AdminService();

  Future<Either<String, AddCityOutput>> addCity(
      {required AddCityInput addCityInput}) async {
    try {
      AddCityOutput addCityOutput =
          await adminService.addCity(addCityInput: addCityInput);
      return right(addCityOutput);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, ApiResponse>> deleteCity({required int id}) async {
    try {
      ApiResponse apiResponse = await adminService.deleteCity(id: id);
      return right(apiResponse);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, ApiResponse>> editCity(
      {required EditCity editCity}) async {
    try {
      ApiResponse apiResponse =
          await adminService.editCity(editCity: editCity);
      return right(apiResponse);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, ApiResponse>> patchCity(
      {required PatchCity patchCity}) async {
    try {
      ApiResponse apiResponse =
          await adminService.patchCity(patchCity: patchCity);
      return right(apiResponse);
    } catch (e) {
      return left(e.toString());
    }
  }
}
