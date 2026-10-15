import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/event/models/all_events/all_events_model.dart';
import 'package:skill_in_a_box_flutter/features/home/model/popular_course_model.dart';

final homeRepositoriesProvider = Provider(
  (ref) => HomeRepositories(),
);

class HomeRepositories {
  final DioClient _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();


  Future<Either<String, List<PopularCourseModel>>> getPopularCourses() async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        ApiConstants.popularCourseEndpoint,
      );

      if (response.statusCode == 200) {
        final courses = (response.data?['course'] as List)
            .map(
              (course) => PopularCourseModel.fromJson(
                course as Map<String, dynamic>,
              ),
            )
            .toList();
        return right(courses);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }

  Future<Either<String, AllEventsModel>> getPopularEvents() async {
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        ApiConstants.allEventsEndpoint,
      );
      if (response.statusCode == 201) {
        final result = AllEventsModel.fromJson(response.data!);
        return right(result);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured $e');
    }
  }
}
