import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/features/assignment/screens/assignment_view.dart';
import 'package:skill_in_a_box_flutter/features/auth/views/forgot_pass_view.dart';
import 'package:skill_in_a_box_flutter/features/auth/views/new_pass_view.dart';
import 'package:skill_in_a_box_flutter/features/auth/views/otp_verification_view.dart';
import 'package:skill_in_a_box_flutter/features/auth/views/password_change_success.dart';
import 'package:skill_in_a_box_flutter/features/auth/views/signin_view.dart';
import 'package:skill_in_a_box_flutter/features/auth/views/signup_view.dart';
import 'package:skill_in_a_box_flutter/features/chats/views/chat.dart';
import 'package:skill_in_a_box_flutter/features/chats/views/chat_room.dart';
import 'package:skill_in_a_box_flutter/features/courses/views/course_details_view.dart';
import 'package:skill_in_a_box_flutter/features/courses/views/courses_view.dart';
import 'package:skill_in_a_box_flutter/features/event/views/event_details_view.dart';
import 'package:skill_in_a_box_flutter/features/event/views/event_view.dart';
import 'package:skill_in_a_box_flutter/features/feedback/views/feedback_view.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/exam_question_params.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/exam_submission_model/exam_submission_model.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/view/final_exam_overview.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/view/final_exam_view.dart';
import 'package:skill_in_a_box_flutter/features/home/views/home_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/curriculum_model/curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/content_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/my_courses_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/my_schedule_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/progress_report_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/views/additionl_assingment_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/views/certificate_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/views/course_settings_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/views/doubt_box_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/views/kit_information_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/views/live_session_booking_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/views/overview_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/views/payment_detail_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/widgets/certificate_view.dart';
import 'package:skill_in_a_box_flutter/features/my_events/views/my_events_view.dart';
import 'package:skill_in_a_box_flutter/features/notifications/views/notification_view.dart';
import 'package:skill_in_a_box_flutter/features/onboarding/views/login_register_view.dart';
import 'package:skill_in_a_box_flutter/features/onboarding/views/onboarding_view.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/address_view.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/enrolled_course_view.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/general_information_view.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/profile_view.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/security_view.dart';
import 'package:skill_in_a_box_flutter/features/profile/views/transaction_history_view.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';
import 'package:skill_in_a_box_flutter/features/quiz/views/quiz_details_view.dart';
import 'package:skill_in_a_box_flutter/features/quiz/views/quiz_question_view.dart';
import 'package:skill_in_a_box_flutter/features/quiz/views/quiz_summary_details_view.dart';
import 'package:skill_in_a_box_flutter/features/quiz/views/quiz_summary_view.dart';

import 'package:skill_in_a_box_flutter/features/self_learning_course/views/self_learning_course.dart';
import 'package:skill_in_a_box_flutter/features/shared/screens/image_view_screen.dart';
import 'package:skill_in_a_box_flutter/features/shared/screens/navigation_screen.dart';
import 'package:skill_in_a_box_flutter/features/shared/screens/pdf_view_screen.dart';
import 'package:skill_in_a_box_flutter/features/shared/screens/recording_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/checkout_address.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/checkout_basicdetails.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/checkout_payment.dart';

part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter() : super();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ForgotPassRoute.page),
        AutoRoute(page: NewPassWordRoute.page),
        AutoRoute(page: OtpVerificationRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: LoginRegisterRoute.page),
        AutoRoute(page: PassWordChangeSuccessRoute.page),
        AutoRoute(page: CourseDetailsRoute.page),
        AutoRoute(page: CheckoutAddressRoute.page),
        AutoRoute(page: CheckoutDetailsRoute.page),
        AutoRoute(page: CheckoutPaymentRoute.page),
        AutoRoute(page: EventDetailsRoute.page),
        AutoRoute(page: FeedBackRoute.page),
        AutoRoute(page: NotificationRoute.page),
        AutoRoute(page: OnBoardingRoute.page, initial: true),
        AutoRoute(page: AddressRoute.page),
        AutoRoute(page: EnrolledCourseRoute.page),
        AutoRoute(page: GeneralInformationRoute.page),
        AutoRoute(page: SecurityRoute.page),
        AutoRoute(page: TransactionHistoryRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: CoursesRoute.page),
        AutoRoute(page: EventRoute.page),
        AutoRoute(page: MyCoursesRoute.page),
        AutoRoute(page: MyEventsRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: NavigationRoute.page),
        AutoRoute(page: QuizDetailsRoute.page),
        AutoRoute(page: QuizQuestionRoute.page),
        AutoRoute(page: QuizSummaryRoute.page),
        AutoRoute(page: QuizSummaryDetailsRoute.page),
        AutoRoute(page: AssignmentViewRoute.page),
        AutoRoute(page: CourseContentRoute.page),
        AutoRoute(page: CourseSettingsRoute.page),
        AutoRoute(page: PaymentDetailRoute.page),
        AutoRoute(page: DoubtBoxRoute.page),
        AutoRoute(page: RecordingRoute.page),
        AutoRoute(page: LiveSessionBookingRoute.page),
        AutoRoute(page: AdditionalAssessmentsRoute.page),
        AutoRoute(page: KitInformationRoute.page),
        AutoRoute(page: CertificateRoute.page),
        AutoRoute(page: CertificateViewRoute.page),
        AutoRoute(page: FinalExamRoute.page),
        AutoRoute(page: FinalExamOverviewRoute.page),
        AutoRoute(page: ChatRoute.page),
        AutoRoute(page: ChatRoomRoute.page),
        AutoRoute(page: MyScheduleRoute.page),
        AutoRoute(page: PdfViewRoute.page),
        AutoRoute(page: ProgressReportViewRoute.page),
        AutoRoute(page: ImageViewRoute.page),
        AutoRoute(page: SelfLearningCourseRoute.page),
        AutoRoute(page: OverviewRoute.page),
      ];
}
