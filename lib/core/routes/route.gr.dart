// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [AdditionalAssessmentsScreen]
class AdditionalAssessmentsRoute extends PageRouteInfo<void> {
  const AdditionalAssessmentsRoute({List<PageRouteInfo>? children})
      : super(
          AdditionalAssessmentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdditionalAssessmentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdditionalAssessmentsScreen();
    },
  );
}

/// generated route for
/// [AddressScreen]
class AddressRoute extends PageRouteInfo<void> {
  const AddressRoute({List<PageRouteInfo>? children})
      : super(
          AddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddressScreen();
    },
  );
}

/// generated route for
/// [AssignmentViewScreen]
class AssignmentViewRoute extends PageRouteInfo<AssignmentViewRouteArgs> {
  AssignmentViewRoute({
    required String courseId,
    required String sectionId,
    required String lessonId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AssignmentViewRoute.name,
          args: AssignmentViewRouteArgs(
            courseId: courseId,
            sectionId: sectionId,
            lessonId: lessonId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AssignmentViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AssignmentViewRouteArgs>();
      return AssignmentViewScreen(
        courseId: args.courseId,
        sectionId: args.sectionId,
        lessonId: args.lessonId,
        key: args.key,
      );
    },
  );
}

class AssignmentViewRouteArgs {
  const AssignmentViewRouteArgs({
    required this.courseId,
    required this.sectionId,
    required this.lessonId,
    this.key,
  });

  final String courseId;

  final String sectionId;

  final String lessonId;

  final Key? key;

  @override
  String toString() {
    return 'AssignmentViewRouteArgs{courseId: $courseId, sectionId: $sectionId, lessonId: $lessonId, key: $key}';
  }
}

/// generated route for
/// [CertificateScreen]
class CertificateRoute extends PageRouteInfo<CertificateRouteArgs> {
  CertificateRoute({
    required String courseId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CertificateRoute.name,
          args: CertificateRouteArgs(
            courseId: courseId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CertificateRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CertificateRouteArgs>();
      return CertificateScreen(
        courseId: args.courseId,
        key: args.key,
      );
    },
  );
}

class CertificateRouteArgs {
  const CertificateRouteArgs({
    required this.courseId,
    this.key,
  });

  final String courseId;

  final Key? key;

  @override
  String toString() {
    return 'CertificateRouteArgs{courseId: $courseId, key: $key}';
  }
}

/// generated route for
/// [CertificateViewPage]
class CertificateViewRoute extends PageRouteInfo<CertificateViewRouteArgs> {
  CertificateViewRoute({
    required String pdfUrl,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CertificateViewRoute.name,
          args: CertificateViewRouteArgs(
            pdfUrl: pdfUrl,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CertificateViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CertificateViewRouteArgs>();
      return CertificateViewPage(
        pdfUrl: args.pdfUrl,
        key: args.key,
      );
    },
  );
}

class CertificateViewRouteArgs {
  const CertificateViewRouteArgs({
    required this.pdfUrl,
    this.key,
  });

  final String pdfUrl;

  final Key? key;

  @override
  String toString() {
    return 'CertificateViewRouteArgs{pdfUrl: $pdfUrl, key: $key}';
  }
}

/// generated route for
/// [ChatRoomScreen]
class ChatRoomRoute extends PageRouteInfo<void> {
  const ChatRoomRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoomRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChatRoomScreen();
    },
  );
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required String roomName,
    required String roomProfile,
    required String roomId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            roomName: roomName,
            roomProfile: roomProfile,
            roomId: roomId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return ChatScreen(
        roomName: args.roomName,
        roomProfile: args.roomProfile,
        roomId: args.roomId,
        key: args.key,
      );
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({
    required this.roomName,
    required this.roomProfile,
    required this.roomId,
    this.key,
  });

  final String roomName;

  final String roomProfile;

  final String roomId;

  final Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{roomName: $roomName, roomProfile: $roomProfile, roomId: $roomId, key: $key}';
  }
}

/// generated route for
/// [CheckoutAddressScreen]
class CheckoutAddressRoute extends PageRouteInfo<CheckoutAddressRouteArgs> {
  CheckoutAddressRoute({
    Key? key,
    bool showShipmentAddress = false,
    List<PageRouteInfo>? children,
  }) : super(
          CheckoutAddressRoute.name,
          args: CheckoutAddressRouteArgs(
            key: key,
            showShipmentAddress: showShipmentAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutAddressRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckoutAddressRouteArgs>(
          orElse: () => const CheckoutAddressRouteArgs());
      return CheckoutAddressScreen(
        key: args.key,
        showShipmentAddress: args.showShipmentAddress,
      );
    },
  );
}

class CheckoutAddressRouteArgs {
  const CheckoutAddressRouteArgs({
    this.key,
    this.showShipmentAddress = false,
  });

  final Key? key;

  final bool showShipmentAddress;

  @override
  String toString() {
    return 'CheckoutAddressRouteArgs{key: $key, showShipmentAddress: $showShipmentAddress}';
  }
}

/// generated route for
/// [CheckoutDetailsScreen]
class CheckoutDetailsRoute extends PageRouteInfo<CheckoutDetailsRouteArgs> {
  CheckoutDetailsRoute({
    Key? key,
    bool showShipmentAddress = false,
    List<PageRouteInfo>? children,
  }) : super(
          CheckoutDetailsRoute.name,
          args: CheckoutDetailsRouteArgs(
            key: key,
            showShipmentAddress: showShipmentAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckoutDetailsRouteArgs>(
          orElse: () => const CheckoutDetailsRouteArgs());
      return CheckoutDetailsScreen(
        key: args.key,
        showShipmentAddress: args.showShipmentAddress,
      );
    },
  );
}

class CheckoutDetailsRouteArgs {
  const CheckoutDetailsRouteArgs({
    this.key,
    this.showShipmentAddress = false,
  });

  final Key? key;

  final bool showShipmentAddress;

  @override
  String toString() {
    return 'CheckoutDetailsRouteArgs{key: $key, showShipmentAddress: $showShipmentAddress}';
  }
}

/// generated route for
/// [CheckoutPaymentScreen]
class CheckoutPaymentRoute extends PageRouteInfo<CheckoutPaymentRouteArgs> {
  CheckoutPaymentRoute({
    required Widget child,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CheckoutPaymentRoute.name,
          args: CheckoutPaymentRouteArgs(
            child: child,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutPaymentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckoutPaymentRouteArgs>();
      return CheckoutPaymentScreen(
        child: args.child,
        key: args.key,
      );
    },
  );
}

class CheckoutPaymentRouteArgs {
  const CheckoutPaymentRouteArgs({
    required this.child,
    this.key,
  });

  final Widget child;

  final Key? key;

  @override
  String toString() {
    return 'CheckoutPaymentRouteArgs{child: $child, key: $key}';
  }
}

/// generated route for
/// [CourseContentScreen]
class CourseContentRoute extends PageRouteInfo<CourseContentRouteArgs> {
  CourseContentRoute({
    required CurriculumModel curriculumModel,
    required Courses courseData,
    required String sectionId,
    required String lessonId,
    required String type,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CourseContentRoute.name,
          args: CourseContentRouteArgs(
            curriculumModel: curriculumModel,
            courseData: courseData,
            sectionId: sectionId,
            lessonId: lessonId,
            type: type,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseContentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CourseContentRouteArgs>();
      return CourseContentScreen(
        curriculumModel: args.curriculumModel,
        courseData: args.courseData,
        sectionId: args.sectionId,
        lessonId: args.lessonId,
        type: args.type,
        key: args.key,
      );
    },
  );
}

class CourseContentRouteArgs {
  const CourseContentRouteArgs({
    required this.curriculumModel,
    required this.courseData,
    required this.sectionId,
    required this.lessonId,
    required this.type,
    this.key,
  });

  final CurriculumModel curriculumModel;

  final Courses courseData;

  final String sectionId;

  final String lessonId;

  final String type;

  final Key? key;

  @override
  String toString() {
    return 'CourseContentRouteArgs{curriculumModel: $curriculumModel, courseData: $courseData, sectionId: $sectionId, lessonId: $lessonId, type: $type, key: $key}';
  }
}

/// generated route for
/// [CourseDetailsScreen]
class CourseDetailsRoute extends PageRouteInfo<CourseDetailsRouteArgs> {
  CourseDetailsRoute({
    required String courseId,
    required String courseType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CourseDetailsRoute.name,
          args: CourseDetailsRouteArgs(
            courseId: courseId,
            courseType: courseType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CourseDetailsRouteArgs>();
      return CourseDetailsScreen(
        courseId: args.courseId,
        courseType: args.courseType,
        key: args.key,
      );
    },
  );
}

class CourseDetailsRouteArgs {
  const CourseDetailsRouteArgs({
    required this.courseId,
    required this.courseType,
    this.key,
  });

  final String courseId;

  final String courseType;

  final Key? key;

  @override
  String toString() {
    return 'CourseDetailsRouteArgs{courseId: $courseId, courseType: $courseType, key: $key}';
  }
}

/// generated route for
/// [CourseSettingsScreen]
class CourseSettingsRoute extends PageRouteInfo<CourseSettingsRouteArgs> {
  CourseSettingsRoute({
    required String courseId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CourseSettingsRoute.name,
          args: CourseSettingsRouteArgs(
            courseId: courseId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CourseSettingsRouteArgs>();
      return CourseSettingsScreen(
        courseId: args.courseId,
        key: args.key,
      );
    },
  );
}

class CourseSettingsRouteArgs {
  const CourseSettingsRouteArgs({
    required this.courseId,
    this.key,
  });

  final String courseId;

  final Key? key;

  @override
  String toString() {
    return 'CourseSettingsRouteArgs{courseId: $courseId, key: $key}';
  }
}

/// generated route for
/// [CoursesScreen]
class CoursesRoute extends PageRouteInfo<void> {
  const CoursesRoute({List<PageRouteInfo>? children})
      : super(
          CoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoursesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CoursesScreen();
    },
  );
}

/// generated route for
/// [DoubtBoxScreen]
class DoubtBoxRoute extends PageRouteInfo<DoubtBoxRouteArgs> {
  DoubtBoxRoute({
    required String courseId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DoubtBoxRoute.name,
          args: DoubtBoxRouteArgs(
            courseId: courseId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DoubtBoxRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DoubtBoxRouteArgs>();
      return DoubtBoxScreen(
        courseId: args.courseId,
        key: args.key,
      );
    },
  );
}

class DoubtBoxRouteArgs {
  const DoubtBoxRouteArgs({
    required this.courseId,
    this.key,
  });

  final String courseId;

  final Key? key;

  @override
  String toString() {
    return 'DoubtBoxRouteArgs{courseId: $courseId, key: $key}';
  }
}

/// generated route for
/// [EnrolledCourseScreen]
class EnrolledCourseRoute extends PageRouteInfo<void> {
  const EnrolledCourseRoute({List<PageRouteInfo>? children})
      : super(
          EnrolledCourseRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnrolledCourseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EnrolledCourseScreen();
    },
  );
}

/// generated route for
/// [EventDetailsScreen]
class EventDetailsRoute extends PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    required EventTypes eventType,
    required String eventId,
    String? eventTitle,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EventDetailsRoute.name,
          args: EventDetailsRouteArgs(
            eventType: eventType,
            eventId: eventId,
            eventTitle: eventTitle,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return EventDetailsScreen(
        eventType: args.eventType,
        eventId: args.eventId,
        eventTitle: args.eventTitle,
        key: args.key,
      );
    },
  );
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({
    required this.eventType,
    required this.eventId,
    this.eventTitle,
    this.key,
  });

  final EventTypes eventType;

  final String eventId;

  final String? eventTitle;

  final Key? key;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{eventType: $eventType, eventId: $eventId, eventTitle: $eventTitle, key: $key}';
  }
}

/// generated route for
/// [EventScreen]
class EventRoute extends PageRouteInfo<void> {
  const EventRoute({List<PageRouteInfo>? children})
      : super(
          EventRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EventScreen();
    },
  );
}

/// generated route for
/// [FeedBackPage]
class FeedBackRoute extends PageRouteInfo<FeedBackRouteArgs> {
  FeedBackRoute({
    required String title,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FeedBackRoute.name,
          args: FeedBackRouteArgs(
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FeedBackRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FeedBackRouteArgs>();
      return FeedBackPage(
        title: args.title,
        key: args.key,
      );
    },
  );
}

class FeedBackRouteArgs {
  const FeedBackRouteArgs({
    required this.title,
    this.key,
  });

  final String title;

  final Key? key;

  @override
  String toString() {
    return 'FeedBackRouteArgs{title: $title, key: $key}';
  }
}

/// generated route for
/// [FinalExamOverviewScreen]
class FinalExamOverviewRoute extends PageRouteInfo<FinalExamOverviewRouteArgs> {
  FinalExamOverviewRoute({
    required ExamSubmissionModel examSubmissionData,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FinalExamOverviewRoute.name,
          args: FinalExamOverviewRouteArgs(
            examSubmissionData: examSubmissionData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FinalExamOverviewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FinalExamOverviewRouteArgs>();
      return FinalExamOverviewScreen(
        examSubmissionData: args.examSubmissionData,
        key: args.key,
      );
    },
  );
}

class FinalExamOverviewRouteArgs {
  const FinalExamOverviewRouteArgs({
    required this.examSubmissionData,
    this.key,
  });

  final ExamSubmissionModel examSubmissionData;

  final Key? key;

  @override
  String toString() {
    return 'FinalExamOverviewRouteArgs{examSubmissionData: $examSubmissionData, key: $key}';
  }
}

/// generated route for
/// [FinalExamScreen]
class FinalExamRoute extends PageRouteInfo<FinalExamRouteArgs> {
  FinalExamRoute({
    required int duration,
    required ExamQuestionParams examQuestionParams,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FinalExamRoute.name,
          args: FinalExamRouteArgs(
            duration: duration,
            examQuestionParams: examQuestionParams,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FinalExamRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FinalExamRouteArgs>();
      return FinalExamScreen(
        duration: args.duration,
        examQuestionParams: args.examQuestionParams,
        key: args.key,
      );
    },
  );
}

class FinalExamRouteArgs {
  const FinalExamRouteArgs({
    required this.duration,
    required this.examQuestionParams,
    this.key,
  });

  final int duration;

  final ExamQuestionParams examQuestionParams;

  final Key? key;

  @override
  String toString() {
    return 'FinalExamRouteArgs{duration: $duration, examQuestionParams: $examQuestionParams, key: $key}';
  }
}

/// generated route for
/// [ForgotPassScreen]
class ForgotPassRoute extends PageRouteInfo<void> {
  const ForgotPassRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPassRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPassRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPassScreen();
    },
  );
}

/// generated route for
/// [GeneralInformationScreen]
class GeneralInformationRoute extends PageRouteInfo<void> {
  const GeneralInformationRoute({List<PageRouteInfo>? children})
      : super(
          GeneralInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralInformationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GeneralInformationScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [ImageViewScreen]
class ImageViewRoute extends PageRouteInfo<ImageViewRouteArgs> {
  ImageViewRoute({
    required String imageUrl,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ImageViewRoute.name,
          args: ImageViewRouteArgs(
            imageUrl: imageUrl,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ImageViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageViewRouteArgs>();
      return ImageViewScreen(
        imageUrl: args.imageUrl,
        key: args.key,
      );
    },
  );
}

class ImageViewRouteArgs {
  const ImageViewRouteArgs({
    required this.imageUrl,
    this.key,
  });

  final String imageUrl;

  final Key? key;

  @override
  String toString() {
    return 'ImageViewRouteArgs{imageUrl: $imageUrl, key: $key}';
  }
}

/// generated route for
/// [KitInformationScreen]
class KitInformationRoute extends PageRouteInfo<KitInformationRouteArgs> {
  KitInformationRoute({
    required String courseId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          KitInformationRoute.name,
          args: KitInformationRouteArgs(
            courseId: courseId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'KitInformationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<KitInformationRouteArgs>();
      return KitInformationScreen(
        courseId: args.courseId,
        key: args.key,
      );
    },
  );
}

class KitInformationRouteArgs {
  const KitInformationRouteArgs({
    required this.courseId,
    this.key,
  });

  final String courseId;

  final Key? key;

  @override
  String toString() {
    return 'KitInformationRouteArgs{courseId: $courseId, key: $key}';
  }
}

/// generated route for
/// [LiveSessionBookingScreen]
class LiveSessionBookingRoute
    extends PageRouteInfo<LiveSessionBookingRouteArgs> {
  LiveSessionBookingRoute({
    required String courseId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LiveSessionBookingRoute.name,
          args: LiveSessionBookingRouteArgs(
            courseId: courseId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LiveSessionBookingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LiveSessionBookingRouteArgs>();
      return LiveSessionBookingScreen(
        courseId: args.courseId,
        key: args.key,
      );
    },
  );
}

class LiveSessionBookingRouteArgs {
  const LiveSessionBookingRouteArgs({
    required this.courseId,
    this.key,
  });

  final String courseId;

  final Key? key;

  @override
  String toString() {
    return 'LiveSessionBookingRouteArgs{courseId: $courseId, key: $key}';
  }
}

/// generated route for
/// [LoginRegisterScreen]
class LoginRegisterRoute extends PageRouteInfo<void> {
  const LoginRegisterRoute({List<PageRouteInfo>? children})
      : super(
          LoginRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginRegisterScreen();
    },
  );
}

/// generated route for
/// [MyCoursesScreen]
class MyCoursesRoute extends PageRouteInfo<void> {
  const MyCoursesRoute({List<PageRouteInfo>? children})
      : super(
          MyCoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCoursesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyCoursesScreen();
    },
  );
}

/// generated route for
/// [MyEventsScreen]
class MyEventsRoute extends PageRouteInfo<void> {
  const MyEventsRoute({List<PageRouteInfo>? children})
      : super(
          MyEventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyEventsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyEventsScreen();
    },
  );
}

/// generated route for
/// [MyScheduleScreen]
class MyScheduleRoute extends PageRouteInfo<MyScheduleRouteArgs> {
  MyScheduleRoute({
    required String courseId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MyScheduleRoute.name,
          args: MyScheduleRouteArgs(
            courseId: courseId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MyScheduleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MyScheduleRouteArgs>();
      return MyScheduleScreen(
        courseId: args.courseId,
        key: args.key,
      );
    },
  );
}

class MyScheduleRouteArgs {
  const MyScheduleRouteArgs({
    required this.courseId,
    this.key,
  });

  final String courseId;

  final Key? key;

  @override
  String toString() {
    return 'MyScheduleRouteArgs{courseId: $courseId, key: $key}';
  }
}

/// generated route for
/// [NavigationScreen]
class NavigationRoute extends PageRouteInfo<NavigationRouteArgs> {
  NavigationRoute({
    required Map<String, String> navItems,
    required List<CustomNavBarScreen> screens,
    required NavigationType navigationType,
    Key? key,
    bool isInnerNavigation = false,
    double? navBarFontSize,
    String? courseId,
    List<PageRouteInfo>? children,
  }) : super(
          NavigationRoute.name,
          args: NavigationRouteArgs(
            navItems: navItems,
            screens: screens,
            navigationType: navigationType,
            key: key,
            isInnerNavigation: isInnerNavigation,
            navBarFontSize: navBarFontSize,
            courseId: courseId,
          ),
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NavigationRouteArgs>();
      return NavigationScreen(
        navItems: args.navItems,
        screens: args.screens,
        navigationType: args.navigationType,
        key: args.key,
        isInnerNavigation: args.isInnerNavigation,
        navBarFontSize: args.navBarFontSize,
        courseId: args.courseId,
      );
    },
  );
}

class NavigationRouteArgs {
  const NavigationRouteArgs({
    required this.navItems,
    required this.screens,
    required this.navigationType,
    this.key,
    this.isInnerNavigation = false,
    this.navBarFontSize,
    this.courseId,
  });

  final Map<String, String> navItems;

  final List<CustomNavBarScreen> screens;

  final NavigationType navigationType;

  final Key? key;

  final bool isInnerNavigation;

  final double? navBarFontSize;

  final String? courseId;

  @override
  String toString() {
    return 'NavigationRouteArgs{navItems: $navItems, screens: $screens, navigationType: $navigationType, key: $key, isInnerNavigation: $isInnerNavigation, navBarFontSize: $navBarFontSize, courseId: $courseId}';
  }
}

/// generated route for
/// [NewPassWordScreen]
class NewPassWordRoute extends PageRouteInfo<NewPassWordRouteArgs> {
  NewPassWordRoute({
    required String email,
    required String otp,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          NewPassWordRoute.name,
          args: NewPassWordRouteArgs(
            email: email,
            otp: otp,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NewPassWordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewPassWordRouteArgs>();
      return NewPassWordScreen(
        email: args.email,
        otp: args.otp,
        key: args.key,
      );
    },
  );
}

class NewPassWordRouteArgs {
  const NewPassWordRouteArgs({
    required this.email,
    required this.otp,
    this.key,
  });

  final String email;

  final String otp;

  final Key? key;

  @override
  String toString() {
    return 'NewPassWordRouteArgs{email: $email, otp: $otp, key: $key}';
  }
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationScreen();
    },
  );
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnBoardingScreen();
    },
  );
}

/// generated route for
/// [OtpVerificationScreen]
class OtpVerificationRoute extends PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    required String email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OtpVerificationRoute.name,
          args: OtpVerificationRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpVerificationRouteArgs>();
      return OtpVerificationScreen(
        email: args.email,
        key: args.key,
      );
    },
  );
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final Key? key;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [OverviewScreen]
class OverviewRoute extends PageRouteInfo<void> {
  const OverviewRoute({List<PageRouteInfo>? children})
      : super(
          OverviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'OverviewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OverviewScreen();
    },
  );
}

/// generated route for
/// [PassWordChangeSuccessScreen]
class PassWordChangeSuccessRoute extends PageRouteInfo<void> {
  const PassWordChangeSuccessRoute({List<PageRouteInfo>? children})
      : super(
          PassWordChangeSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'PassWordChangeSuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PassWordChangeSuccessScreen();
    },
  );
}

/// generated route for
/// [PaymentDetailScreen]
class PaymentDetailRoute extends PageRouteInfo<PaymentDetailRouteArgs> {
  PaymentDetailRoute({
    required String courseId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PaymentDetailRoute.name,
          args: PaymentDetailRouteArgs(
            courseId: courseId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentDetailRouteArgs>();
      return PaymentDetailScreen(
        courseId: args.courseId,
        key: args.key,
      );
    },
  );
}

class PaymentDetailRouteArgs {
  const PaymentDetailRouteArgs({
    required this.courseId,
    this.key,
  });

  final String courseId;

  final Key? key;

  @override
  String toString() {
    return 'PaymentDetailRouteArgs{courseId: $courseId, key: $key}';
  }
}

/// generated route for
/// [PdfViewScreen]
class PdfViewRoute extends PageRouteInfo<PdfViewRouteArgs> {
  PdfViewRoute({
    required String title,
    String? link,
    bool isNetwork = true,
    File? pickedFile,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PdfViewRoute.name,
          args: PdfViewRouteArgs(
            title: title,
            link: link,
            isNetwork: isNetwork,
            pickedFile: pickedFile,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfViewRouteArgs>();
      return PdfViewScreen(
        title: args.title,
        link: args.link,
        isNetwork: args.isNetwork,
        pickedFile: args.pickedFile,
        key: args.key,
      );
    },
  );
}

class PdfViewRouteArgs {
  const PdfViewRouteArgs({
    required this.title,
    this.link,
    this.isNetwork = true,
    this.pickedFile,
    this.key,
  });

  final String title;

  final String? link;

  final bool isNetwork;

  final File? pickedFile;

  final Key? key;

  @override
  String toString() {
    return 'PdfViewRouteArgs{title: $title, link: $link, isNetwork: $isNetwork, pickedFile: $pickedFile, key: $key}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [ProgressReportViewScreen]
class ProgressReportViewRoute
    extends PageRouteInfo<ProgressReportViewRouteArgs> {
  ProgressReportViewRoute({
    required String sectionId,
    required String reportCardId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProgressReportViewRoute.name,
          args: ProgressReportViewRouteArgs(
            sectionId: sectionId,
            reportCardId: reportCardId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProgressReportViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProgressReportViewRouteArgs>();
      return ProgressReportViewScreen(
        sectionId: args.sectionId,
        reportCardId: args.reportCardId,
        key: args.key,
      );
    },
  );
}

class ProgressReportViewRouteArgs {
  const ProgressReportViewRouteArgs({
    required this.sectionId,
    required this.reportCardId,
    this.key,
  });

  final String sectionId;

  final String reportCardId;

  final Key? key;

  @override
  String toString() {
    return 'ProgressReportViewRouteArgs{sectionId: $sectionId, reportCardId: $reportCardId, key: $key}';
  }
}

/// generated route for
/// [QuizDetailsScreen]
class QuizDetailsRoute extends PageRouteInfo<QuizDetailsRouteArgs> {
  QuizDetailsRoute({
    required QuizBodyParams quizBodyParams,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QuizDetailsRoute.name,
          args: QuizDetailsRouteArgs(
            quizBodyParams: quizBodyParams,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizDetailsRouteArgs>();
      return QuizDetailsScreen(
        quizBodyParams: args.quizBodyParams,
        key: args.key,
      );
    },
  );
}

class QuizDetailsRouteArgs {
  const QuizDetailsRouteArgs({
    required this.quizBodyParams,
    this.key,
  });

  final QuizBodyParams quizBodyParams;

  final Key? key;

  @override
  String toString() {
    return 'QuizDetailsRouteArgs{quizBodyParams: $quizBodyParams, key: $key}';
  }
}

/// generated route for
/// [QuizQuestionScreen]
class QuizQuestionRoute extends PageRouteInfo<QuizQuestionRouteArgs> {
  QuizQuestionRoute({
    required int duration,
    required QuizBodyParams quizBodyParams,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QuizQuestionRoute.name,
          args: QuizQuestionRouteArgs(
            duration: duration,
            quizBodyParams: quizBodyParams,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizQuestionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizQuestionRouteArgs>();
      return QuizQuestionScreen(
        duration: args.duration,
        quizBodyParams: args.quizBodyParams,
        key: args.key,
      );
    },
  );
}

class QuizQuestionRouteArgs {
  const QuizQuestionRouteArgs({
    required this.duration,
    required this.quizBodyParams,
    this.key,
  });

  final int duration;

  final QuizBodyParams quizBodyParams;

  final Key? key;

  @override
  String toString() {
    return 'QuizQuestionRouteArgs{duration: $duration, quizBodyParams: $quizBodyParams, key: $key}';
  }
}

/// generated route for
/// [QuizSummaryDetailsScreen]
class QuizSummaryDetailsRoute
    extends PageRouteInfo<QuizSummaryDetailsRouteArgs> {
  QuizSummaryDetailsRoute({
    required QuizBodyParams quizBodyParams,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QuizSummaryDetailsRoute.name,
          args: QuizSummaryDetailsRouteArgs(
            quizBodyParams: quizBodyParams,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizSummaryDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizSummaryDetailsRouteArgs>();
      return QuizSummaryDetailsScreen(
        quizBodyParams: args.quizBodyParams,
        key: args.key,
      );
    },
  );
}

class QuizSummaryDetailsRouteArgs {
  const QuizSummaryDetailsRouteArgs({
    required this.quizBodyParams,
    this.key,
  });

  final QuizBodyParams quizBodyParams;

  final Key? key;

  @override
  String toString() {
    return 'QuizSummaryDetailsRouteArgs{quizBodyParams: $quizBodyParams, key: $key}';
  }
}

/// generated route for
/// [QuizSummaryScreen]
class QuizSummaryRoute extends PageRouteInfo<QuizSummaryRouteArgs> {
  QuizSummaryRoute({
    required QuizBodyParams quizBodyParams,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QuizSummaryRoute.name,
          args: QuizSummaryRouteArgs(
            quizBodyParams: quizBodyParams,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizSummaryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizSummaryRouteArgs>();
      return QuizSummaryScreen(
        quizBodyParams: args.quizBodyParams,
        key: args.key,
      );
    },
  );
}

class QuizSummaryRouteArgs {
  const QuizSummaryRouteArgs({
    required this.quizBodyParams,
    this.key,
  });

  final QuizBodyParams quizBodyParams;

  final Key? key;

  @override
  String toString() {
    return 'QuizSummaryRouteArgs{quizBodyParams: $quizBodyParams, key: $key}';
  }
}

/// generated route for
/// [RecordingScreen]
class RecordingRoute extends PageRouteInfo<void> {
  const RecordingRoute({List<PageRouteInfo>? children})
      : super(
          RecordingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecordingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RecordingScreen();
    },
  );
}

/// generated route for
/// [SecurityScreen]
class SecurityRoute extends PageRouteInfo<void> {
  const SecurityRoute({List<PageRouteInfo>? children})
      : super(
          SecurityRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecurityRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SecurityScreen();
    },
  );
}

/// generated route for
/// [SelfLearningCourseScreen]
class SelfLearningCourseRoute extends PageRouteInfo<void> {
  const SelfLearningCourseRoute({List<PageRouteInfo>? children})
      : super(
          SelfLearningCourseRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelfLearningCourseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SelfLearningCourseScreen();
    },
  );
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignInScreen();
    },
  );
}

/// generated route for
/// [SignupScreen]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignupScreen();
    },
  );
}

/// generated route for
/// [TransactionHistoryScreen]
class TransactionHistoryRoute extends PageRouteInfo<void> {
  const TransactionHistoryRoute({List<PageRouteInfo>? children})
      : super(
          TransactionHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TransactionHistoryScreen();
    },
  );
}
