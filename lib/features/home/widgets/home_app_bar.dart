import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_states.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_view_model.dart';
import 'package:skill_in_a_box_flutter/features/notifications/view_model/notification_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsState = ref.watch(basicDetailsViewModelProvider);
    final homeState = ref.watch(homeViewModelProvider);
    return Padding(
      padding: EdgeInsets.only(
        left: context.screenWidth * 0.04,
        right: context.screenWidth * 0.04,
        top: context.screenWidth * 0.04,
        bottom: context.screenWidth * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: context.screenWidth * 0.4,
            child: Row(
              children: [
                GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: (userDetailsState
                                    .userDetails?.student?.profilePic ==
                                null ||
                            homeState is HomeFailure ||
                            homeState is HomeLoading)
                        ? null
                        : NetworkImage(
                            userDetailsState.userDetails!.student!.profilePic!,
                          ),
                    // onBackgroundImageError: (exception, stackTrace) {},
                    backgroundColor: silverChalice.shade100,
                  ),
                  onTap: () {
                    ref
                        .read(basicDetailsViewModelProvider.notifier)
                        .fetchUserBasicDetails();
                    context.router.push(const ProfileRoute());
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.screenWidth * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => context.router.push(
                    const ChatRoomRoute(),
                  ),
                  child: badges.Badge(
                    badgeContent: Text(
                      '3',
                      style: heading4.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    child: SvgPicture.asset(Assets.icons.message),
                  ),
                ),
                SizedBox(width: context.screenWidth * 0.045),
                InkWell(
                  onTap: () {
                    ref
                        .read(notificationViewModelNotifier.notifier)
                        .getNotification();
                    context.router.push(
                      const NotificationRoute(),
                    );
                  },
                  child: badges.Badge(
                    badgeContent: Text(
                      '3',
                      style: heading4.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    child: SvgPicture.asset(
                      Assets.icons.notification,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
