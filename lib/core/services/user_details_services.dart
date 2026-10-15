import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/basic_details_model/basic_details_model.dart';

@lazySingleton
class UserDetailsServices {
  final _flutterSecureStorage = getIt<FlutterSecureStorage>();
  static const String _keyUserDetails = 'user_details';

  Future<void> saveUserDetails(BasicDetailsModel userDetails) async {
    try {
      final jsonString = json.encode(userDetails.toJson());
      await _flutterSecureStorage.write(
        key: _keyUserDetails,
        value: jsonString,
      );
    } catch (e) {
      throw Exception('Failed to save user details');
    }
  }

  Future<Either<String, BasicDetailsModel?>> getUserDetails() async {
    try {
      final jsonString = await _flutterSecureStorage.read(key: _keyUserDetails);
      if (jsonString == null) return left('Something went wrong!');
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return right(BasicDetailsModel.fromJson(jsonMap));
    } catch (e) {
      return left('Something went wrong!');
    }
  }

  Future<void> deleteUserDetails() async {
    try {
      await _flutterSecureStorage.delete(key: _keyUserDetails);
      print('YYY details deleted');
    } catch (e) {
      throw Exception('Failed to delete user details');
    }
  }

  Future<bool> hasValue() async {
    return _flutterSecureStorage.containsKey(key: _keyUserDetails);
  }
}
