import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/security_model/password_reset_model.dart';

final securityRepositoryProvider = Provider((ref) => SecurityRepository());

class SecurityRepository {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, bool>> resetPassword(
    PassWordResetModel updatedPassword,
  ) async {
    try {
      final response = await _dioClient.dio.patch<Map<String, dynamic>>(
        ApiConstants.resetProfilePasswordEndpoint,
        data: updatedPassword.toJson(),
      );
      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return e.response?.statusCode == 422
          ? left('Current Password is Incorrect')
          : left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }
}
