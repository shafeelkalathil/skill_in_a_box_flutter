import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/basic_details_model/basic_details_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/profile_picture_model/profile_picture_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/repositories/basic_details_repository.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/general_information_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/repositories/file_upload_repository.dart';

final profilePictureViewModelProvider =
    StateNotifierProvider<ProfilePictureViewModel, BasicDetailsState>(
  (ref) => ProfilePictureViewModel(
    ref.watch(basicDetailsRepositoryProvider),
    ref.watch(fileUploadRepositoryProvider),
  ),
);

class ProfilePictureViewModel extends StateNotifier<BasicDetailsState> {
  ProfilePictureViewModel(
    this.basicDetailsRepository,
    this.fileUploadRepositories,
  ) : super(BasicDetailsInitial());

  final BasicDetailsRepository basicDetailsRepository;
  final FileUploadRepositories fileUploadRepositories;

  Future<void> saveProfilePicture(
    ProfilePictureModel profilePictureModel,
    Student student,
    WidgetRef ref,
  ) async {
    state = BasicDetailsLoading();
    final file = File(profilePictureModel.path!);
    final platformFile = PlatformFile(
      name: file.path.split('/').last,
      size: file.lengthSync(),
      path: file.path,
    );

    final response =
        await fileUploadRepositories.fileUpload(file: platformFile);
    response.fold((errorMessage) {
      state = BasicDetailsFailed(errorMessage: errorMessage);
    }, (responseData) {
      final updatedStudent = student.copyWith(profilePic: responseData.url);
      ref
          .read(basicDetailsViewModelProvider.notifier)
          .updateUserBasicDetails(updatedStudent, ref);
    });
  }

  Future<void> saveAvatar(
    String pictureUrl,
    Student student,
    WidgetRef ref,
  ) async {
    state = BasicDetailsLoading();
    final updatedStudent = student.copyWith(profilePic: pictureUrl);
    await ref
        .read(basicDetailsViewModelProvider.notifier)
        .updateUserBasicDetails(updatedStudent, ref);
  }

  Future<void> pickAndCropImage(WidgetRef ref) async {
    final imagePicker = ImagePicker();
    final imageCropper = ImageCropper();

    final file = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (file != null) {
      final croppedFile = await imageCropper.cropImage(
        sourcePath: file.path,
        aspectRatio: const CropAspectRatio(ratioX: 1080, ratioY: 1080),
      );
      if (croppedFile != null) {
        ref.read(selectedImageProvider.notifier).state =
            ProfilePictureModel(type: 'device', path: croppedFile.path);
      }
    }
  }
}
