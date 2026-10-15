import 'package:skill_in_a_box_flutter/features/shared/model/file_upload_model/file_upload_model.dart';

abstract class FileUploadStates {}

class FileUploadInitial implements FileUploadStates {}

class FileUploadLoading implements FileUploadStates {
  FileUploadLoading({required this.progress});

  final double progress;
}

class FileUploadSuccess implements FileUploadStates {
  FileUploadSuccess({required this.isSuccess});
  bool isSuccess;
}

class FileUploadedSuccess implements FileUploadStates {
  FileUploadedSuccess({required this.fileUploadModel});
  final FileUploadModel fileUploadModel;
}

class FileUploadFailed implements FileUploadStates {
  FileUploadFailed({required this.errorMessage});

  final String errorMessage;
}


