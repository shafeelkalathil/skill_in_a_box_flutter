import 'package:file_picker/file_picker.dart';

abstract class AssignmentUploadStates {
  AssignmentUploadStates({this.pickedFileList});
  final List<PlatformFile>? pickedFileList;
}

class AssignmentUploadInitial implements AssignmentUploadStates {
  @override
  List<PlatformFile>? get pickedFileList => null;
}

class AssignmentUploadLoading implements AssignmentUploadStates {
  AssignmentUploadLoading({required this.uploadStatus,this.pickedFile});
  List<PlatformFile>? pickedFile;
  Map<int, double> uploadStatus;
  @override
  List<PlatformFile>? get pickedFileList => pickedFile;
}

class AssignmentFilePicked implements AssignmentUploadStates {
  AssignmentFilePicked({required this.pickedFile});
  List<PlatformFile> pickedFile;

  @override
  List<PlatformFile>? get pickedFileList => pickedFile;
}

class AssignmentUploadSuccess implements AssignmentUploadStates {
  @override
  List<PlatformFile>? get pickedFileList => null;
}

class AssignmentUploadFailed implements AssignmentUploadStates {
  AssignmentUploadFailed({required this.errorMessage});

  final String errorMessage;

  @override
  List<PlatformFile>? get pickedFileList => null;
}
