import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course_curriculum/course_curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course/course_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course_overview/course_overview_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/section_model/section_request_model/section_request_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/section_model/section_response_model/course_section_model.dart';

final courseRepositoryProvider = Provider<CourseRepository>(
  (ref) => CourseRepository(),
);

class CourseRepository {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  /// Fetches all courses.
  Stream<List<Course>> fetchAllCourses() async* {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        ApiConstants.listAllCourseEndpoint,
      );

      if (response.statusCode == 201) {
        final courses = CourseModel.fromJson(response.data!);

        yield courses.course??[];
      } else {
        throw Exception('Failed to fetch courses');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']?.toString() ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Fetches course overview by course ID.
  Future<Either<String, CourseOverviewModel>> fetchCourseOverview(
      {required String courseId,}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      final response = await _dioClient.dio.get<Map<String,dynamic>>(
        '${ApiConstants.courseEndpoint}/${ApiConstants.overviewEndpoint}/$courseId',
      );

      if (response.statusCode == 200) {
        return right(
          CourseOverviewModel.fromJson(response.data!,),
        );
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e,s) {
      print(s);
      final response = e.response;
      if (response != null) {
        return left(e.response?.data['message']?.toString() ?? e.message!);
      } else {
        return left(_exceptionHandler.getExceptionMessage(e));
      }
    } catch (e,s) {
      print(s);
      return left('Unknown Error Occurred');
    }
  }

  /// Fetches course curriculum by course ID.
  Future<Either<String, CourseCurriculumModel>> fetchCourseCurriculum(
      {required String courseId,}) async {
    try {
      print('course id : $courseId');
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '${ApiConstants.courseEndpoint}/${ApiConstants.curriculumEndpoint}/$courseId',
      );

      if (response.statusCode == 200) {
        // Validate and parse data
        final data = response.data;
        if (data == null ||
            data['curriculum'] == null ||
            data['curriculum']['sections'] == null) {
          return left('Invalid curriculum data received from server');
        }

        final curriculum = CourseCurriculumModel.fromJson(
          data['curriculum'] as Map<String, dynamic>,
        );
        return right(curriculum);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data?['message']?.toString() ??
          e.message ??
          'Unknown Dio error';
      final response = e.response;
      if (response != null) {
        return left(errorMessage);
      } else {
        return left(_exceptionHandler.getExceptionMessage(e));
      }
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

//curriculum
  Future<Either<String, CourseSectionModel>> getCourseSection({
    required String courseId,
    required String sectionId,
  }) async {
    final requestModel =
        SectionRequestModel(sectionId: sectionId, courseId: courseId);
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        ApiConstants.getCourseSectionEndpoint,
        data: requestModel.toJson(),
      );
      if (response.statusCode == 201) {
        final result = CourseSectionModel.fromJson(response.data!);
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
