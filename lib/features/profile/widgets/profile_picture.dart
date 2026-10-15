import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/basic_details_model/basic_details_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/profile_picture_model/profile_picture_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/profile_picture_view_model/profile_picture_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/general_information_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/circular_progress_indicator.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class ProfilePicture extends ConsumerWidget {
  const ProfilePicture({
    required this.details,
    required this.dark,
    required this.isNetworkImageSelected,
    required this.selectedImage,
    required this.avatarList,
    super.key,
  });

  final BasicDetailsModel? details;
  final bool dark;
  final bool isNetworkImageSelected;
  final ProfilePictureModel selectedImage;
  final List<String> avatarList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageSelected = ref.watch(selectedImageProvider);
    final userDetailsState = ref.watch(basicDetailsViewModelProvider);
    return RoundedContainer(
      darkModeBorderColor: Colors.transparent,
      widget: Column(
        children: [
          CircleAvatar(
            radius: context.screenWidth * 0.18,
            backgroundImage: imageSelected.path != null
                ? imageSelected.type == 'network'
                    ? NetworkImage(imageSelected.path!)
                    : FileImage(File(imageSelected.path!))
                : details?.student?.profilePic != null
                    ? NetworkImage(details!.student!.profilePic!)
                    : null,
            child: Padding(
              padding: EdgeInsets.only(
                left: context.screenWidth * 0.2,
                top: context.screenHeight * 0.12,
              ),
              child: InkWell(
                onTap: () {
                  ref
                      .read(profilePictureViewModelProvider.notifier)
                      .pickAndCropImage(ref);
                },
                child: CircleAvatar(
                  radius: context.screenWidth * 0.08,
                  backgroundColor: orange.shade500,
                  child: Center(
                    child: SvgPicture.asset(Assets.icons.camera),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.015,
          ),
          Text(
            details?.student?.firstName ?? 'Name',
            style: heading2.copyWith(
              color: dark ? Colors.white : silverChalice.shade800,
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
          SizedBox(
            height: context.screenHeight * 0.2,
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: context.screenHeight * 0.01,
                crossAxisSpacing: context.screenWidth * 0.01,
              ),
              itemBuilder: (context, index) {
                final imageSelected = isNetworkImageSelected &&
                    (selectedImage.path == avatarList[index]);
                return InkWell(
                  onTap: () {
                    imageSelected
                        ? ref.read(selectedImageProvider.notifier).state =
                            ProfilePictureModel()
                        : ref.read(selectedImageProvider.notifier).state =
                            ProfilePictureModel(
                            type: 'network',
                            path: avatarList[index],
                          );
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: imageSelected ? orange : Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(avatarList[index]),
                            radius: context.screenWidth * 0.2,
                            backgroundColor: orange.shade100,
                          ),
                        ),
                      ),
                      if (imageSelected)
                        Center(
                          child: SvgPicture.asset(
                            Assets.icons.tickWhite,
                            width: 40,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (imageSelected.path != null)
            Center(
              child: userDetailsState is BasicDetailsLoading
                  ? Padding(
                      padding:
                          EdgeInsets.only(top: context.screenHeight * 0.04),
                      child: const CustomCircularProgressIndicator(),
                    )
                  : Container(
                      padding: EdgeInsets.only(
                        top: context.screenHeight * 0.04,
                      ),
                      width: context.screenWidth * 0.43,
                      child: ElevatedButton(
                        onPressed: () {
                          imageSelected.type == 'network'
                              ? ref
                                  .read(
                                    profilePictureViewModelProvider.notifier,
                                  )
                                  .saveAvatar(
                                    imageSelected.path!,
                                    userDetailsState.userDetails!.student!,
                                    ref,
                                  )
                              : ref
                                  .read(
                                    profilePictureViewModelProvider.notifier,
                                  )
                                  .saveProfilePicture(
                                    imageSelected,
                                    userDetailsState.userDetails!.student!,
                                    ref,
                                  );
                        },
                        child: const Text('Save'),
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}
