import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/notifications/model/notification_model.dart';

final notificationRepositoriesProvider =
Provider<NotificationRepositories>((ref) => NotificationRepositories(),);

class NotificationRepositories{

  final _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, NotificationModel>> getNotification() async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final response = await _dioClient.dio.get<Map<String,dynamic>>(
        ApiConstants.notificationEndpoint,
      );
      if (response.statusCode == 200) {
        final result = NotificationModel.fromJson(response.data!);
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
