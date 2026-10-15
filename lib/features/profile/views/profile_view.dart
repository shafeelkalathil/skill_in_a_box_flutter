import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/services/user_auth_services.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/address_view_model/address_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/enrolled_courses_view_model/enrolled_courses_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/transaction_history_view_model/transaction_history_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/address_view.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/enrolled_course_view.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/general_information_view.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/security_view.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/transaction_history_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final UserAuthService _authService = getIt<UserAuthService>();
  List<ListTileItem> _buildListTileItems(WidgetRef ref) {
    return [
      ListTileItem(
        icon: Assets.icons.generalInformation,
        title: 'General Information',
        onTapFunction: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GeneralInformationScreen(),
            ),
          );
        },
      ),
      ListTileItem(
        icon: Assets.icons.address,
        title: 'Address',
        onTapFunction: () {
          ref.read(addressViewModelNotifier.notifier).fetchAddressDetails();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddressScreen(),
            ),
          );
        },
      ),
      ListTileItem(
        icon: Assets.icons.enrolledCourse,
        title: 'Enrolled Courses',
        onTapFunction: () {
          ref
              .read(enrolledCoursesViewModelProvider.notifier)
              .fetchEnrolledCourses();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EnrolledCourseScreen(),
            ),
          );
        },
      ),
      ListTileItem(
        icon: Assets.icons.transactionHistory,
        title: 'Transaction History',
        onTapFunction: () {
          ref
              .read(transactionHistoryViewModelProvider.notifier)
              .fetchTransactionHistory();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TransactionHistoryScreen(),
            ),
          );
        },
      ),
      ListTileItem(
        icon: Assets.icons.security,
        title: 'Security',
        onTapFunction: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SecurityScreen(),
            ),
          );
        },
      ),
      ListTileItem(
        icon: Assets.icons.logout,
        title: 'Log Out',
        onTapFunction: () async {
          await ref
              .read(basicDetailsViewModelProvider.notifier)
              .clearUserDetails();
          await _authService.logOut();
          await context.router.pushAndPopUntil(
            const SignInRoute(),
            predicate: (route) => false,
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = _buildListTileItems(ref);
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      onTap: items[index].onTapFunction,
                      contentPadding:
                          EdgeInsets.only(right: context.screenWidth * 0.03),
                      leading: SvgPicture.asset(
                        item.icon,
                        colorFilter: ColorFilter.mode(
                          dark ? Colors.white :silverChalice.shade800,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(
                          left: context.screenWidth * 0.02,
                        ),
                        child: Text(
                          item.title,
                          style: subtitle1.copyWith(
                            color: dark ? Colors.white : silverChalice.shade800,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileItem {
  ListTileItem({
    required this.icon,
    required this.title,
    this.onTapFunction,
  });
  final String icon;
  final String title;
  void Function()? onTapFunction;
}
