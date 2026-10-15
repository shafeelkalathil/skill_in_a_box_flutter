class SaveQuestionBody {

  SaveQuestionBody({
    required this.questionId,
    required this.courseId,
    required this.sectionId,
    required this.quizId,
    required this.submittedAnswer,
    required this.submittedLanguage,
  });

  final String questionId;
  final String courseId;
  final String sectionId;
  final String quizId;
  final List<String> submittedAnswer;
  final String submittedLanguage;

}
