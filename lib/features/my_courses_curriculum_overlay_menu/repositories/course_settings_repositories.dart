import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/course_extend_validity/course_extend_validity_model.dart';

import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/course_extend_validity/course_extend_data_model/course_extend_data_model.dart';

final courseSettingsRepositoriesProvider =
Provider<CourseSettingsRepositories>((ref) => CourseSettingsRepositories(),);

class CourseSettingsRepositories{

  final _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, CourseExtendDataModel>> getExtendValidity
      ({required String courseId}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final response = await _dioClient.dio.get<Map<String,dynamic>>(
        '${ApiConstants.courseEndpoint}/${ApiConstants.extendValidityEndpoint}/$courseId',
      );
      if (response.statusCode == 200) {
        final result = CourseExtendDataModel.fromJson(response.data!);
        return right(result);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

  Future<Either<String, CourseExtendValidityModel>> courseExtendValidity
      ({required String courseId,required String extendPeriod}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = {
        'period' : extendPeriod,
      };
      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        '${ApiConstants.courseEndpoint}/${ApiConstants.extendValidityEndpoint}/$courseId',
        data: data,
      );
      if (response.statusCode == 201) {
        final result = CourseExtendValidityModel.fromJson(response.data!);
        return right(result);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

}
