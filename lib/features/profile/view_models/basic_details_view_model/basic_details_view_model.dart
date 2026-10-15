import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/services/user_details_services.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/basic_details_model/basic_details_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/profile_picture_model/profile_picture_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/update_details_model/update_details_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/repositories/basic_details_repository.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/general_information_view.dart';

part 'basic_details_states.dart';

StateProvider<bool> isBasicInformationEditCheck = StateProvider((ref) => false);
StateProvider<bool> isAdditionalInformationEditCheck =
    StateProvider((ref) => false);

final basicDetailsViewModelProvider =
    StateNotifierProvider<BasicDetailsViewModel, BasicDetailsState>(
  (ref) => BasicDetailsViewModel(
    basicDetailsRepository: ref.read(basicDetailsRepositoryProvider),
  ),
);

class BasicDetailsViewModel extends StateNotifier<BasicDetailsState> {
  BasicDetailsViewModel({
    required this.basicDetailsRepository,
  }) : super(BasicDetailsInitial());

  final BasicDetailsRepository basicDetailsRepository;
  final _userDetailsServices = getIt<UserDetailsServices>();

  Future<void> fetchUserBasicDetails() async {
    state = BasicDetailsLoading(detailsOfUser: state.userDetails);
    final hasUserData = await _userDetailsServices.hasValue();
    if (hasUserData) {
      print('user data fetched from storage');
      final userData = await _userDetailsServices.getUserDetails();
      userData.fold((errorMessage) {
        state = BasicDetailsFailed(
          errorMessage: 'exception in save user details',
          detailsOfUser: state.userDetails,
        );
      }, (data) {
        state = BasicDetailsSuccess(detailsOfUser: data);
      });
    } else {
      print('user data fetched from api');
      final result = await basicDetailsRepository.getBasicDetails();
      result.fold(
        (errorMessage) {
          state = BasicDetailsFailed(
            errorMessage: errorMessage,
            detailsOfUser: state.userDetails,
          );
        },
        (basicDetailsModel) {
          try {
            _userDetailsServices.saveUserDetails(basicDetailsModel);
            state = BasicDetailsSuccess(detailsOfUser: basicDetailsModel);
          } catch (e) {
            state = BasicDetailsFailed(
              errorMessage: 'exception in save user details',
              detailsOfUser: state.userDetails,
            );
          }
        },
      );
    }
  }

  Future<void> clearUserDetails() async {
    state = BasicDetailsSuccess();
    await _userDetailsServices.deleteUserDetails();
  }

  // Future<void> getUserBasicDetails() async {
  //   BasicDetailsModel? userDetails;
  //   state = BasicDetailsLoading(
  //     detailsOfUser: state.userDetails,
  //   );
  //   try {
  //     userDetails = await _userDetailsServices.getUserDetails();
  //   } catch (e) {
  //     state = BasicDetailsFailed(
  //       errorMessage: 'exception in get user details',
  //       detailsOfUser: state.userDetails,
  //     );
  //   }

  //   if (userDetails == null) {
  //     await fetchUserBasicDetails();
  //   } else {
  //     state = BasicDetailsSuccess(detailsOfUser: userDetails);
  //   }
  // }

  Future<void> updateUserBasicDetails(
    Student student,
    WidgetRef ref,
  ) async {
    final userModelForUpdation = UpdateDetailsModel(
      firstName: student.firstName,
      lastName: student.lastName,
      email: student.email,
      phoneNumber: PhoneNumber(phoneNumber: student.phoneNumber),
      country: student.country,
      profilePic: student.profilePic,
      studentId: student.studentId,
      dateOfBirth: student.dateOfBirth,
      fatherName: student.fatherName,
      motherName: student.motherName,
    );

    final userModelForState = BasicDetailsModel(student: student);
    state = BasicDetailsLoading(
      detailsOfUser: userModelForState,
    );

    //CHANGE THIS CONDITION FOR VALIDATING PHONE NUMBER
    if ((student.phoneNumber ?? '').length >= 10) {
      final result =
          await basicDetailsRepository.updateBasicDetails(userModelForUpdation);
      await result.fold((errorMessage) {
        state = BasicDetailsFailed(
          errorMessage: errorMessage,
          detailsOfUser: userModelForState,
        );
      }, (isUpdated) async {
        // await fetchUserBasicDetails();
        await _userDetailsServices.saveUserDetails(userModelForState);
        state = BasicDetailsSuccess(detailsOfUser: userModelForState);
        ref.read(isBasicInformationEditCheck.notifier).state = false;
        ref.read(isAdditionalInformationEditCheck.notifier).state = false;
        ref.read(selectedImageProvider.notifier).state = ProfilePictureModel();
      });
    } else {
      state = BasicDetailsFailed(
        errorMessage: 'Phone Number Should have 10 Digits ',
        detailsOfUser: userModelForState,
      );
    }
  }
}
