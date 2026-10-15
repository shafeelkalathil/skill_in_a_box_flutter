import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/enrolled_courses_model/enrolled_courses_model.dart';

final enrolledCoursesRepositoryProvider =
    Provider((ref) => EnrolledCoursesRepository());

class EnrolledCoursesRepository {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, EnrolledCourses>> getEnrolledCourses() async {
    try {
      final response = await _dioClient.dio
          .post<Map<String, dynamic>>(ApiConstants.enrolledCoursesEndpoint);
      if (response.statusCode == 201) {
        final result = EnrolledCourses.fromJson(response.data!);
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
}
