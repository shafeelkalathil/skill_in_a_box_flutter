import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/auth/models/sign_in/student_login_model.dart';
import 'package:skill_in_a_box_flutter/features/auth/models/sign_up/student_model.dart';

final authRepositoriesProvider = Provider((ref) => AuthRepositories(),);

class AuthRepositories {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, StudentLoginModel>> login(String email, String password) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,String>{
        'email': email,
        'password': password,
      };

      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        ApiConstants.loginEndpoint,
        data: data,
      );

      if (response.statusCode == 201) {
        return right(StudentLoginModel.fromJson(response.data!),);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return left(e.response!.data['message'].toString());
      }
      else {
        return left(_exceptionHandler.getExceptionMessage(e));
      }
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }


  Future<Either<String, String>> register(StudentModel studentData) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      final data = studentData.toJson();
      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        ApiConstants.registerEndpoint,
        data: data,
      );
      if (response.statusCode == 201) {
        return right('Success');
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.data is Map && e.response!.data['message'] != null) {
        return left(e.response!.data['message'].toString());
      }
      else {
        return left(_exceptionHandler.getExceptionMessage(e));
      }
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }


  Future<Either<dynamic,String>> forgotPassword (String email) async {
    try{
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,String>{
        'email': email,
      };
      final response = await _dioClient.dio.post<dynamic>(
        ApiConstants.forgotPasswordEndpoint,
        data: data,
      );

      if (response.statusCode == 201) {
        return right('OTP sent successfully');
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return left('User not found');
      }
      else {
        return left(_exceptionHandler.getExceptionMessage(e));
      }
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

  Future<Either<dynamic,String>> verifyOtp (String email,String otp) async {
    try{
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,String>{
        'email': email,
        'otp': otp,
      };
      final response = await _dioClient.dio.post<dynamic>(
        ApiConstants.verifyOtpEndpoint,
        data: data,
      );

      if (response.statusCode == 201) {
        return right('OTP verified successfully');
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return left('Invalid OTP');
      }
      else {
        return left(_exceptionHandler.getExceptionMessage(e));
      }
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

  Future<Either<dynamic,String>> resetPassword (String email,String otp,String password) async {
    try{
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,String>{
        'password': password,
        'email': email,
        'otp': otp,
      };
      final response = await _dioClient.dio.post<dynamic>(
        ApiConstants.resetPasswordEndpoint,
        data: data,
      );

      if (response.statusCode == 201) {
        return right('Password SuccessFully Updated');
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      final response = e.response;
      if (response != null) {
        return left(response.data['message'].toString());
      }
      else {
        return left(_exceptionHandler.getExceptionMessage(e));
      }
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }
}
