import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/address_model/address_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/update_address_model/update_address_model.dart';

final addressRepositoryProvider = Provider((ref) => AddressRepository());

class AddressRepository {
  final _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, AddressModel>> getAddressDetails() async {
    try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '/getStudentAddress',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        final result = AddressModel.fromJson(response.data!);
        return right(result);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }

  Future<Either<String, AddressModel>> updateAddressDetails(
    UpdateAddressModel updatedAddress,
  ) async {
    try {
      final updateAddressResponse =
          await _dioClient.dio.post<Map<String, dynamic>>(
        '/address',
        data: updatedAddress.toJson(),
      );
      if (updateAddressResponse.statusCode == 201) {
        final fetchNewAddressResponse =
            await _dioClient.dio.get<Map<String, dynamic>>(
          '/getStudentAddress',
          options: Options(headers: {'Content-Type': 'application/json'}),
        );
        if (fetchNewAddressResponse.statusCode == 200) {
          final result = AddressModel.fromJson(fetchNewAddressResponse.data!);
          return right(result);
        } else {
          return left(
            _exceptionHandler
                .getErrorMessage(fetchNewAddressResponse.statusCode),
          );
        }
      } else {
        return left(
          _exceptionHandler.getErrorMessage(updateAddressResponse.statusCode),
        );
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }
}
