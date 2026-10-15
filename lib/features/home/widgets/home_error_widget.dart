import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_states.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({
    required this.homeState,
    required this.ref,
    super.key,
  });

  final HomeFailure homeState;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return CustomErrorWidget(
      errorMessage: homeState.errorMessage,
      padding: EdgeInsets.only(
        top: context.screenHeight * 0.2,
      ),
      onPressed: () {
        ref
            .read(
              basicDetailsViewModelProvider.notifier,
            )
            .fetchUserBasicDetails();
        ref.read(homeViewModelProvider.notifier).fetchHomeData();
      },
    );
  }
}
