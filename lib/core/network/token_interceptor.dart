import 'package:dio/dio.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/services/user_auth_services.dart';
import 'package:skill_in_a_box_flutter/core/services/user_details_services.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor({
    required this.dio,
    this.excludedPaths = const [],
  });

  final Dio dio;
  final List<String> excludedPaths;
  final UserAuthService _authService = getIt<UserAuthService>();
  final UserDetailsServices _userDetailsServices = getIt<UserDetailsServices>();

  bool _isRefreshing = false; // Add this flag

  bool _shouldExclude(RequestOptions options) {
    return excludedPaths.any((path) => options.path.contains(path));
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_shouldExclude(options)) {
      return handler.next(options);
    }

    final accessToken = await _authService.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    } else {
      // No token available - might need to trigger login flow
      await _logout();
      return handler.reject(
        DioException(
          requestOptions: options,
          error: 'No access token available',
        ),
      );
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 &&
        !_shouldExclude(err.requestOptions)) {
      try {
        if (!_isRefreshing) {
          await _refreshToken();
        }
        return handler.resolve(await _retry(err.requestOptions));
      } catch (e) {
        return handler.next(err);
      }
    }
    return handler.next(err);
  }

  Future<void> _refreshToken() async {
    if (_isRefreshing) return;

    try {
      _isRefreshing = true;
      final refreshToken = await _authService.getRefreshToken();
      if (refreshToken == null) {
        throw Exception('No refresh token available');
      }

      final response = await dio.get<dynamic>(
        ApiConstants.refreshTokenUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $refreshToken',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final newAccessToken =
            (response.data as Map<String, dynamic>)['accessToken'].toString();
        final newRefreshToken =
            (response.data as Map<String, dynamic>)['refreshToken'].toString();
        final userId =
            (response.data as Map<String, dynamic>)['user']['id'].toString();
        await _authService.login(newAccessToken, newRefreshToken,userId);
      } else {
        throw Exception('Invalid refresh token response');
      }
    } catch (e) {
      await _logout();
      throw Exception('Failed to refresh token: $e');
    } finally {
      _isRefreshing = false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    final accessToken = await _authService.getAccessToken();
    options.headers?['Authorization'] = 'Bearer $accessToken';

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<void> _logout() async {
    await _authService.logOut();
    await _userDetailsServices.deleteUserDetails();
    await getIt<AppRouter>().replaceAll([const SignInRoute()]);
  }
}
