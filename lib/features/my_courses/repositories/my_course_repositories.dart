import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/curriculum_model/curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_slots_model/my_slots_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/notes_model/notes_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/recording_model/recording_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/report_card_model/report_card_details/report_card_details_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/report_card_model/report_card_list_model/report_card_model.dart';

final myCourseRepositoryProvider = Provider<MyCourseRepository>(
  (ref) => MyCourseRepository(),
);

class MyCourseRepository {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  /// Fetches all my courses.
  Future<Either<String, List<Courses>?>> fetchAllMyCourses() async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      final response = await _dioClient.dio
          .post<Map<String, dynamic>>(ApiConstants.listMyCoursesEndpoint);

      if (response.statusCode == 201) {
        final coursesData = MyCourseModel.fromJson(response.data!);

        final courses = coursesData.courses;
        return right(courses);

        // yield courses ?? [];
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }

  Future<Either<String, CurriculumModel>> fetchCurriculum(
    String courseId,
  ) async {
    try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '${ApiConstants.curriculumfetchEndpoint}$courseId',
      );
      if (response.statusCode == 200) {
        final result = CurriculumModel.fromJson(response.data!);
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

  Future<Either<String, NotesModel>> getNotes({
    required String courseId,
    required String lessonId,
    required String sectionId,
  }) async {
    final requestModel = GetNotesModel(
      lessonId: lessonId,
      courseId: courseId,
      sectionId: sectionId,
    );
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        ApiConstants.getNotesEndpoint,
        data: requestModel.toJson(),
      );
      if (response.statusCode == 201) {
        final result = NotesModel.fromJson(response.data!);
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

  Future<Either<String, bool>> saveNote({
    required String courseId,
    required String note,
    required String sectionId,
    required String lessonId,
  }) async {
    final requestModel =
        SaveNoteModel(courseId: courseId, sectionId: sectionId, note: note);
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        '${ApiConstants.saveNoteEndpoint}$lessonId',
        data: requestModel.toJson(),
      );
      if (response.statusCode == 201) {
        return right(true);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }

  Future<Either<String, bool>> updateNote({
    required String courseId,
    required List<String> note,
    required String sectionId,
    required String lessonId,
  }) async {
    final requestModel =
        UpdateNoteModel(courseId: courseId, sectionId: sectionId, note: note);
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        '${ApiConstants.updateNoteEndpoint}$lessonId',
        data: requestModel.toJson(),
      );
      if (response.statusCode == 201) {
        return right(true);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }

  Future<Either<String, MySlotsModel>> listMySlots({
    required String startDate,
    required String endDate,
  }) async {
    try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '${ApiConstants.listMySlotsEndpoint}startDate=$startDate&endDate=$endDate',
      );
      if (response.statusCode == 200) {
        final result = MySlotsModel.fromJson(response.data!);
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

  Future<Either<String, bool>> cancelSlot({
    required String slotId,
  }) async {
    try {
      final response = await _dioClient.dio
          .patch<Map<String, dynamic>>('${ApiConstants.cancelSlot}$slotId');
      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }

  Future<Either<String, ReportCardModel>> fetchReportCards({
    required String courseId,
  }) async {
    try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '${ApiConstants.fetchReportCardsEndPoint}$courseId',
      );
      final result = ReportCardModel.fromJson(response.data!);
      if (response.statusCode == 200) {
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

  Future<Either<String, ReportCardDetailsModel>> fetchReportCardDetails({
    required String reportCardId,
    required String sectionId,
  }) async {
    try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '${ApiConstants.reportCardDetailsEndPoint}reportCardId=$reportCardId&sectionId=$sectionId',
      );
      final result = ReportCardDetailsModel.fromJson(response.data!);
      if (response.statusCode == 200) {
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

  Future<Either<String, RecordingModel>> fetchRecording(String courseId) async {
      try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '${ApiConstants.getRecordingsEndpoint}$courseId',
      );
      if (response.statusCode == 200) {
        final result = RecordingModel.fromJson(response.data!);
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
