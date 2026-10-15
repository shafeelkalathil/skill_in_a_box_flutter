import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/network/token_interceptor.dart';

@lazySingleton
class DioClient {
  DioClient() {
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    dio.interceptors.addAll([
      TokenInterceptor(dio: dio, excludedPaths: excludedPaths),
      PrettyDioLogger(canShowLog: kDebugMode),
    ]);
  }
  late Dio dio;
  // add paths to exclude token
  List<String> excludedPaths = ['auth/refresh', '/login'];
}
