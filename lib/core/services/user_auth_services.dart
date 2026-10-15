import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';


@lazySingleton
class UserAuthService {
  UserAuthService();
  final FlutterSecureStorage _flutterSecureStorage =
      getIt<FlutterSecureStorage>();

  Future<void> login(String accessToken, String refreshToken,String userId) async {
    await _flutterSecureStorage.write(key: 'access_token', value: accessToken);
    await _flutterSecureStorage.write(
      key: 'refresh_token',
      value: refreshToken,
    );
    await _flutterSecureStorage.write(
      key: 'userId',
      value: userId,
    );
  }

  Future<void> logOut() async {
    await _flutterSecureStorage.delete(key: 'access_token');
    await _flutterSecureStorage.delete(key: 'refresh_token');
    await _flutterSecureStorage.delete(key: 'userId');
  }

  Future<String?> getAccessToken() async {
    return _flutterSecureStorage.read(key: 'access_token');
  }

  Future<String?> getRefreshToken() async {
    return _flutterSecureStorage.read(key: 'refresh_token');
  }

  Future<String?> getUserId() async {
    return _flutterSecureStorage.read(key: 'userId');
  }

  Future<bool> isLoggedIn() async {
    return _flutterSecureStorage.containsKey(key: 'access_token');
  }
}
