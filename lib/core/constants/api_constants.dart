class ApiConstants {
  static String baseUrl = 'https://backend.qa.sib.norqlabs.com/student';
  static String refreshTokenUrl =
      'https://backend.qa.sib.norqlabs.com/auth/refresh';
 

  /// auth endpoints ::: start
  static String loginEndpoint = '/login';
  static String registerEndpoint = '/register';
  static String forgotPasswordEndpoint = '/forgot-password';
  static String verifyOtpEndpoint = '/verifyOtp';
  static String resetPasswordEndpoint = '/resetPassword';
  static String enrolledCoursesEndpoint = '/enrolledCourses';
  static String transactionHistoryEndpoint = '/transactionHistory';
  static String resetProfilePasswordEndpoint = '/profile/resetPassword';

  /// auth endpoints ::: end

  /// events endpoints ::: start
  static String allEventsEndpoint = '/listAllEvents';
  static String filteredEventsEndpoint = '/listFilteredEvents';
  static String eventDetailsEndpoint = '/event/';
  /// events endpoints ::: end
  
  /// my events endpoints ::: start
  static String listMyEventsEndPoint = '/myEvents?status=all';
  static String myEventDetailsEndPoint = '/myEventsById?eventId=';
  static String joinMyEventEndpoint = '/joinEvent?eventId=';
  /// my events endpoints ::: end
  
  /// feedback form endpoints ::: start
  static String getFeedbackFormEndpoint = '/getFeedbackForm?usage=';
  /// feedback form endpoints ::: end

  /// course endpoints ::: start
  static String courseEndpoint = '/course';
  static String listAllCourseEndpoint = '/listAllCourse';
  static String listMyCoursesEndpoint = '/listMyCourses';
  static String overviewEndpoint = '/overview';
  static String curriculumEndpoint = '/curriculum';
  static String popularCourseEndpoint = '/popularCourses';
  static String kitEndpoint = '/kit';
  static String paymentMethodsEndpoint = '/paymentMethods';
  static String certificateEndpoint = '/certificate';
  static String leaderboardEndpoint = '/leaderboard';
  static String quizSummaryEndpoint = '/quizSummary';
  static String quizSummaryDetailsEndpoint = '/details';
  static String quizEndpoint = '/quiz';
  static String startQuizEndpoint = '/startQuiz';
  static String questionEndpoint = '/question';
  static String submitQuizEndpoint = '/submitQuiz';
  static String extendValidityEndpoint = '/extendValidity';
  static String startFinalExamEndpoint = '/finalExam/start';
  static String finalExamStatusEndpoint = '/finalExam/status';
  static String examSubmissionDetailsEndpoint = '/finalExam/submissionDetails';
  static String examEndpoint = '/exam';
  static String saveAnswerEndpoint = '/saveAnswer';
  static String submitFinalExamEndpoint = '/submitFinalExam';
  static String notificationEndpoint = '/getAllNotificationList';
  static String getCourseSectionEndpoint = '/course/section';
  /// course endpoints ::: end

  /// my course endpoints ::: start
  static String curriculumfetchEndpoint = '/myCourse/curriculum/';
  static String sectionDetailsfetchEndpoint = '/myCourse/section';
  static String lessonDetailsfetchEndpoint = '/lesson/';
  static String quizStatusfetchEndpoint = '/quizStatus/';
  static String updateLessonProgressEndpoint = '${lessonDetailsfetchEndpoint}updateProgress/';
  static String getRecordingsEndpoint = '/course/recordings?courseId=';
  /// my course endpoints ::: end

  /// notes endpoints ::: start
  static String getNotesEndpoint = '/getNote';
  static String saveNoteEndpoint = '/saveNote/';
  static String updateNoteEndpoint = '/updateNote/';
  /// notes endpoints ::: end

  /// doubt box endpoints ::: start
  static String getDoubtBoxSectionsEndpoint = '/MyCourse/doubtBox/sections/';
  static String getDoubtBoxSectionDetailsEndpoint = '/myCourse/doubtBox/';
  static String doubtBoxLikeEndpoint = '/updateLike/';
  /// doubt box endpoints ::: end

  /// assignment endpoints ::: start
  static String getAssignmentEndpoint = '/myCourse/assignment/';
  static String uploadAssignmentEndpoint = '/submit/courseAssignment';

  /// assignment sendpoints ::: end

  ///live session booking endpoints ::: start
  static String listAllSlotsEndpoint = '/listAllSlots?';
  static String bookSlotEndpoint = '/bookSlot/';
  static String listMySlotsEndpoint = '/listMySlots?';
  static String cancelSlot = '/cancelSlot/';

  ///live session booking endpoints ::: end

  ///report card endpoints ::: start
  static String fetchReportCardsEndPoint = '/course/listReportCards?courseId=';
  static String reportCardDetailsEndPoint = '/course/GetReportCardById?';

  ///report card endpoints ::: end
}
