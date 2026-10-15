import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/basic_details_model/basic_details_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/profile_picture_model/profile_picture_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/widgets/additional_information.dart';
import 'package:skill_in_a_box_flutter/features/profile/widgets/basic_information.dart';
import 'package:skill_in_a_box_flutter/features/profile/widgets/profile_picture.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

final selectedImageProvider =
    StateProvider<ProfilePictureModel>((ref) => ProfilePictureModel());

@RoutePage()
class GeneralInformationScreen extends ConsumerStatefulWidget {
  const GeneralInformationScreen({super.key});

  @override
  ConsumerState<GeneralInformationScreen> createState() =>
      _GeneralInformationScreenState();
}

class _GeneralInformationScreenState
    extends ConsumerState<GeneralInformationScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(basicDetailsViewModelProvider);
    final userDetails = state.userDetails;
    ref.listen(basicDetailsViewModelProvider, (previous, current) {
      if (current is BasicDetailsFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              current.errorMessage,
            ),
            backgroundColor: red.shade500,
          ),
        );
      }
    });
    return Scaffold(
      appBar: const CustomAppBar(title: 'General Information'),
      body: SafeArea(
        child: UserDetails(details: userDetails),
      ),
    );
  }
}

class UserDetails extends ConsumerWidget {
  UserDetails({
    required this.details,
    super.key,
  });

  final BasicDetailsModel? details;
  final List<String> avatarList = [
    'https://bucket-sib.s3.ap-south-1.amazonaws.com/profile1.jpeg',
    'https://bucket-sib.s3.ap-south-1.amazonaws.com/profile2.jpeg',
    'https://bucket-sib.s3.ap-south-1.amazonaws.com/profile3.jpeg',
    'https://bucket-sib.s3.ap-south-1.amazonaws.com/profile4.jpeg',
    'https://bucket-sib.s3.ap-south-1.amazonaws.com/profile5.jpeg',
    'https://bucket-sib.s3.ap-south-1.amazonaws.com/profile6.jpeg',
    'https://bucket-sib.s3.ap-south-1.amazonaws.com/profile7.jpeg',
    'https://bucket-sib.s3.ap-south-1.amazonaws.com/profile8.jpeg',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedImage = ref.watch(selectedImageProvider);
    final isNetworkImageSelected = selectedImage.type == 'network';
    final dark = AppHelpers.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.06,
          vertical: context.screenHeight * 0.01,
        ),
        child: Column(
          children: [
            ProfilePicture(
              details: details,
              dark: dark,
              isNetworkImageSelected: isNetworkImageSelected,
              selectedImage: selectedImage,
              avatarList: avatarList,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            const BasicInformation(),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            const AdditionalInformation(),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),SizedBox(
              height: context.screenHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}


