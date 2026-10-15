import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/assignment/models/upload_assignment/upload_assignment_model.dart';
import 'package:skill_in_a_box_flutter/features/assignment/repositories/assignment_repository.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_upload_view_model/assignment_upload_states.dart';
import 'package:skill_in_a_box_flutter/features/shared/repositories/file_upload_repository.dart';

final assignmentUploadViewModelProvider = StateNotifierProvider.family<
    AssignmentUploadViewModel, AssignmentUploadStates, String>(
  (ref, lessonId) => AssignmentUploadViewModel(
    ref.watch(fileUploadRepositoryProvider),
    ref.watch(assignmentRepositoryProvider),
  ),
);

class AssignmentUploadViewModel extends StateNotifier<AssignmentUploadStates> {
  AssignmentUploadViewModel(
    this.fileUploadRepository,
    this.assignmentRepository,
  ) : super(AssignmentUploadInitial());

  final FileUploadRepositories fileUploadRepository;
  final AssignmentRepository assignmentRepository;

  Future<void> fetchFile() async {
    // state = AssignmentUploadLoading(pickedFile: state.pickedFileList);
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
      );
      if (result != null) {
        final selectedFile = result.files;
        final availableFiles = state.pickedFileList ?? [];
        state = AssignmentFilePicked(pickedFile: availableFiles + selectedFile);
      }
    } catch (e) {
      state = AssignmentUploadFailed(errorMessage: 'Error in Picking File');
    }
  }

  void removeFile(int index) {
    final availableFiles = state.pickedFileList;
    availableFiles!.removeAt(index);
    state = AssignmentFilePicked(pickedFile: availableFiles);
  }

  Future<void> uploadFile(
    WidgetRef ref, {
    required String lessonId,
    required String courseId,
    required String sectionId,
  }) async {
    try {
      final pickedFiles = state.pickedFileList ?? [];
      final uploadStatus = <int, double>{};
      final uploadFiles = <Files>[];
      var index = 0;
      for (final file in pickedFiles) {
        final response = await fileUploadRepository.fileUpload(
          file: file,
          onSendProgress: (sent, total) {
            uploadStatus[index] = sent / total;
            state = AssignmentUploadLoading(
              uploadStatus: uploadStatus,
              pickedFile: state.pickedFileList,
            );
          },
        );
        response.fold(
          (errorMessage) {
            print('error message is $errorMessage');
            state = AssignmentUploadFailed(errorMessage: errorMessage);
            return;
          },
          (responseModel) {
            final uploadFile = Files(
              name: file.name,
              type: file.extension,
              link: responseModel.url,
              size: file.size,
              id: responseModel.url,
            );
            uploadFiles.add(uploadFile);
          },
        );
        index = index + 1;
      }
      print('upload completed');
      // final submissionData =
      //     SubmissionData(files: uploadFiles, date: DateTime.now().toString());
      // final assignmentUploadModel = UploadAssignmentModel(
      //   assignmentId: lessonId,
      //   courseId: courseId,
      //   sectionId: sectionId,
      //   type: 'course',
      //   submissionData: submissionData,
      // );
      // final response = await assignmentRepository.uploadAssignment(
      //   uploadModel: assignmentUploadModel,
      // );
      // response.fold((errorMessage) {
      //   state = AssignmentUploadFailed(errorMessage: errorMessage);
      // }, (isSuccess) {
      //   state = AssignmentUploadSuccess();
      // });
    } catch (e) {
      print('error is $e');
      // state = AssignmentUploadFailed(errorMessage: 'Error in Picking File');
    }
  }
}
