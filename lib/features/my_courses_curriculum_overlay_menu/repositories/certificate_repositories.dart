import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/certificate/certificate_model.dart';

final certificateRepositoryProvider = Provider<CertificateRepository>(
  (ref) => CertificateRepository(),
);

class CertificateRepository {
  final _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();

  /// Fetches certificate details.
  Future<Either<String, CertificateModel>> getCertificateDetails(
      {required String courseId}) async {
    try {
      print('aaaaaaaaaaaaaaa');
      print(courseId);
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '${ApiConstants.courseEndpoint}/${ApiConstants.certificateEndpoint}',
        queryParameters: {
          'courseId': courseId,
        },
      );
      if (response.statusCode == 200) {
        print('bbbbbbbbbbbbb');
        print(response.data);
        final result = CertificateModel.fromJson(response.data!);

        return right(result);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e,s) {
      print(s);
      return left('Unknown Error Occurred');
    }
  }
}
