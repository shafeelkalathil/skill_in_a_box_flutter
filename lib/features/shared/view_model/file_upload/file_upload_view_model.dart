import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/shared/repositories/file_upload_repository.dart';
import 'package:skill_in_a_box_flutter/features/shared/view_model/file_upload/file_upload_states.dart';

final fileUploadViewModelProvider =
StateNotifierProvider<FileUploadViewModel, FileUploadStates>(
      (ref) => FileUploadViewModel(ref.watch(fileUploadRepositoryProvider)),
);

class FileUploadViewModel extends StateNotifier<FileUploadStates> {
  FileUploadViewModel(this.fileUploadRepository) : super(FileUploadInitial());

  final FileUploadRepositories fileUploadRepository;

  // Future<void> pickFile({
  //   required FileType fileType,
  // }) async {
  //   try {
  //     final result = await FilePicker.platform.pickFiles(
  //       type: fileType,
  //     );
  //     if (result != null) {
  //       final selectedFile = result.files.first;
  //       final response = await fileUploadRepository.fileUpload(
  //         file: selectedFile,
  //         onSendProgress: (sent, total) {
  //           state = FileUploadLoading(progress: sent / total);
  //         },
  //       );
  //       response.fold(
  //             (errorMessage) {
  //           state = FileUploadFailed(errorMessage: errorMessage);
  //         },
  //             (isUpload) {
  //           state = FileUploadSuccess(isSuccess: isUpload);
  //         },
  //       );
  //     }
  //   } catch (e) {
  //     state = FileUploadFailed(errorMessage: 'Error in Picking File');
  //   }
  // }

  Future<void> uploadFile(PlatformFile file) async {
    final result = await fileUploadRepository.uploadFile(
      file: file,
      onSendProgress: (sent, total) {
        state = FileUploadLoading(progress: sent / total);
      },
    );
    result.fold(
          (errorMessage) {
        state = FileUploadFailed(errorMessage: errorMessage);
      },
          (fileUploadData) {
      state = FileUploadedSuccess(fileUploadModel: fileUploadData);
    },
    );

  }

}
