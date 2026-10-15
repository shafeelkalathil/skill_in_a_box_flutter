
class SaveExamParams {

  SaveExamParams({
    required this.examId,
    required this.courseId,
    required this.questionId,
    required this.submittedLanguage,
    required this.submittedAnswer,
  });
  final String courseId;
  final String examId;
  final String questionId;
  final String submittedLanguage;
  final List<String> submittedAnswer;
}
