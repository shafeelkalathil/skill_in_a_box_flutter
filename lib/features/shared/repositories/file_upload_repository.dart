import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/features/shared/model/file_upload_model/file_upload_model.dart';


final fileUploadRepositoryProvider = Provider<FileUploadRepositories>(
      (ref) => FileUploadRepositories(),
);

class FileUploadRepositories {
  final dio = Dio();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, FileUploadModel>> fileUpload({
    required PlatformFile file,
    void Function(int, int)? onSendProgress,
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path!, filename: file.name),
    });
    try {
      final response = await dio.post<Map<String, dynamic>>(
        'https://backend.dev.sib.norqlabs.com/uploadFile',
        data: formData,
        onSendProgress: onSendProgress,
      );
      if (response.statusCode == 201) {
        final result = FileUploadModel.fromJson(response.data!);
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

  Future<Either<String, FileUploadModel>> uploadFile({
    required PlatformFile file,
    required void Function(int, int)? onSendProgress,
  }) async {
    final formData = FormData.fromMap({
      'file':
      await MultipartFile.fromFile(file.path!, filename: file.name),
    });
    try {
      final response = await dio.post<Map<String, dynamic>>(
        'https://backend.dev.sib.norqlabs.com/uploadFile',
        data: formData,
        onSendProgress: onSendProgress,
      );
      if (response.statusCode == 201) {
        return right(FileUploadModel.fromJson(response.data!));
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
