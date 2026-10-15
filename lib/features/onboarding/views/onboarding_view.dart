import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/services/user_auth_services.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/courses/views/courses_view.dart';
import 'package:skill_in_a_box_flutter/features/event/views/event_view.dart';
import 'package:skill_in_a_box_flutter/features/home/views/home_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/my_courses_view.dart';
import 'package:skill_in_a_box_flutter/features/my_events/views/my_events_view.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

StateProvider<dynamic> userIdProvider = StateProvider(
  (ref) => '',
);

@RoutePage()
class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

final UserAuthService authService = getIt<UserAuthService>();

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      if (await authService.isLoggedIn()) {
        ref.read(userIdProvider.notifier).state = await authService.getUserId();
        await context.router.pushAndPopUntil(
          NavigationRoute(
            navigationType: NavigationType.home,
            navItems: {
              'Home': Assets.icons.home,
              'Courses': Assets.icons.course,
              'Events': Assets.icons.events,
              'My Courses': Assets.icons.mycourse,
              'My Events': Assets.icons.myevents,
            },
            screens: const [
              CustomNavBarScreen(screen: HomeScreen()),
              CustomNavBarScreen(screen: CoursesScreen()),
              CustomNavBarScreen(screen: EventScreen()),
              CustomNavBarScreen(screen: MyCoursesScreen()),
              CustomNavBarScreen(screen: MyEventsScreen()),
            ],
          ),
          predicate: (route) => false,
        );
      } else {
        await context.router.pushAndPopUntil(
          const LoginRegisterRoute(),
          predicate: (route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          dark ? Assets.images.logoDarkmode : Assets.images.logo,
        ),
      ),
    );
  }
}
