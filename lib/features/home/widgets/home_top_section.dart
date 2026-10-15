import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_states.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

final homeSearchProvider = StateProvider<String>((ref) => '');

class HomeTopSection extends ConsumerWidget {
  HomeTopSection({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);
    final userDetailsState = ref.watch(basicDetailsViewModelProvider);
    final userName = userDetailsState.userDetails?.student == null
        ? 'Learner'
        : '${userDetailsState.userDetails?.student?.firstName ?? ''}${userDetailsState.userDetails?.student?.lastName ?? ''}';
    final dark = AppHelpers.isDarkMode(context);
    return Container(
      padding: EdgeInsets.only(
        left: context.screenWidth * 0.04,
        right: context.screenWidth * 0.04,
        bottom: context.screenWidth * 0.06,
        top: context.screenWidth * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: context.screenHeight * 0.03),
          if (homeState is HomeLoading)
            ShimmerCard(
              width: context.screenWidth * 0.4,
              height: context.screenHeight * 0.02,
              borderRadius: 24,
            )
          else
            Text(
              'Hi $userName !',
              style: heading3.copyWith(
                color: dark ? Colors.white : silverChalice.shade900,
              ),
            ),
          Text(
            'Find a course that interests you',
            style: heading4.copyWith(
              color: dark ? const Color(0xffD3D3D3) : silverChalice.shade300,
            ),
          ),
          SizedBox(height: context.screenHeight * 0.03),
          if (homeState is HomeLoading)
            ShimmerCard(
              width: context.screenWidth,
              height: context.screenHeight * 0.06,
              borderRadius: 8,
            )
          else
          CustomTextField(
            prefixIcon: SvgPicture.asset(
              Assets.icons.search,
            ),
            hintText: 'Search',
            controller: searchController,
            onChanged: (value) {
              ref.read(homeSearchProvider.notifier).state = value.toLowerCase();
            },
          ),
        ],
      ),
    );
  }
}
