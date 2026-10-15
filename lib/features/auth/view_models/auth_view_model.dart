import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/services/user_auth_services.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/auth/models/sign_up/student_model.dart';
import 'package:skill_in_a_box_flutter/features/auth/repositories/auth_repositorie.dart';
import 'package:skill_in_a_box_flutter/features/auth/view_models/auth_state.dart';
import 'package:skill_in_a_box_flutter/features/courses/views/courses_view.dart';
import 'package:skill_in_a_box_flutter/features/event/views/event_view.dart';
import 'package:skill_in_a_box_flutter/features/home/views/home_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/my_courses_view.dart';
import 'package:skill_in_a_box_flutter/features/my_events/views/my_events_view.dart';
import 'package:skill_in_a_box_flutter/features/onboarding/views/onboarding_view.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';


final authViewModelProvider = NotifierProvider<AuthViewModel, AuthState>(
      AuthViewModel.new,
);

// class AuthViewModel extends StateNotifier<AuthState> {
  class AuthViewModel extends Notifier<AuthState> {
  // AuthViewModel({required this.authRepositories}) : super(AuthInitial());

  @override
  AuthState build() {
    return AuthInitial();
  }

  AuthRepositories get authRepositories=>ref.read(authRepositoriesProvider);
  final UserAuthService authService = getIt<UserAuthService>();
  // final UserDetailsServices userDetailsService = getIt<UserDetailsServices>();

  // final AuthRepositories authRepositories;
  // final UserAuthService authService = getIt<UserAuthService>();
  // final UserDetailsServices userDetailsService = getIt<UserDetailsServices>();

  Future<void> login
      (String email, String password, BuildContext context) async {
    state = AuthLoading();
    try {
      final res = await authRepositories.login(email, password);
      res.fold(
            (l) {
          state = AuthFailure(l);
          AppHelpers.showSnackBar(l, context);
        },
            (data) {
          authService.login(data.accessToken, data.refreshToken,data.user.id);
          state = AuthSuccess(data.accessToken, data.refreshToken);
          ref.read(userIdProvider.notifier).state = data.user.id;
          context.router.pushAndPopUntil(
            NavigationRoute(
              navigationType: NavigationType.home,
              navItems: {
                'Home': Assets.icons.home,
                'Courses': Assets.icons.course,
                'Events': Assets.icons.events,
                'My Courses': Assets.icons.mycourse,
                'My Events': Assets.icons.myevents,
              },
              screens:  const [
                CustomNavBarScreen(screen: HomeScreen()),
                CustomNavBarScreen(screen: CoursesScreen()),
                CustomNavBarScreen(screen: EventScreen()),
                CustomNavBarScreen(screen: MyCoursesScreen()),
                CustomNavBarScreen(screen: MyEventsScreen()),
              ],
            ),
            predicate: (route) => false,
          );
          AppHelpers.showSnackBar('Login success', context);
        },
      );
    } catch (e) {
      state = AuthFailure(e.toString());
      AppHelpers.showSnackBar(e.toString(), context);
    }
  }

  Future<void> register(StudentModel studentData, BuildContext context) async {
    state = AuthLoading();
    try {
      final res = await authRepositories.register(studentData);
      res.fold(
            (l) {
          state = AuthFailure('');
          AppHelpers.showSnackBar(l, context);
        },
            (data) {
          state = AuthSuccess('', '');
          context.router.pushAndPopUntil(
            const SignInRoute(),
            predicate: (route) => false,
          );
          AppHelpers.showSnackBar('Register success', context);
        },
      );
    } catch (e) {
      state = AuthFailure(e.toString());
      AppHelpers.showSnackBar(e.toString(), context);
    }
  }

  Future<void> forgotPassword(String email, BuildContext context) async {
    state = AuthLoading();
    try {
      final res = await authRepositories.forgotPassword(email);
      res.fold(
            (l) {
          state = AuthFailure('User not found');
          AppHelpers.showSnackBar('User not found', context);
        },
            (data) {
          state = AuthSuccess('','');
          context.router.push(
              OtpVerificationRoute(
                email: email,
              ),
          );
          AppHelpers.showSnackBar('OTP sent successfully', context);
        },
      );
    } catch (e) {
      state = AuthFailure(e.toString());
      AppHelpers.showSnackBar(e.toString(), context);
    }
  }

  Future<void> verifyOtp(String email, String otp, BuildContext context) async {
    state = AuthLoading();
    try {
      final res = await authRepositories.verifyOtp(email,otp);
      res.fold(
            (l) {
          state = AuthFailure('Incorrect otp');
          AppHelpers.showSnackBar('Incorrect otp', context);
        },
            (data) {
          state = AuthSuccess('','');
          context.router.push(
            NewPassWordRoute(
              email: email,
              otp: otp,
            ),
          );
          AppHelpers.showSnackBar('OTP verified', context);
        },
      );
    } catch (e) {
      state = AuthFailure(e.toString());
      AppHelpers.showSnackBar(e.toString(), context);
    }
  }

  Future<void> resetPassword
      (String email, String otp, String password,  BuildContext context) async {
    state = AuthLoading();
    try {
      final res = await authRepositories.resetPassword(email,otp,password);
      res.fold((l) {
          state = AuthFailure('Password Should not be same as previous');
          AppHelpers.showSnackBar(
              'Password Should not be same as previous',
              context,);
        }, (data) {
          state = AuthSuccess('','');
          context.router.push(
            const PassWordChangeSuccessRoute(),
          );
          AppHelpers.showSnackBar('Password SuccessFully Updated', context);
        },
      );
    } catch (e) {
      state = AuthFailure(e.toString());
      AppHelpers.showSnackBar(e.toString(), context);
    }
  }
}
