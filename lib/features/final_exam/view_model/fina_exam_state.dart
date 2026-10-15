
import 'package:skill_in_a_box_flutter/features/final_exam/model/exam_submission_model/exam_submission_model.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/final_exam_question_model/final_exam_question_model.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/final_exam_status_model/final_exam_status_model.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/save_exam_answer_model/save_exam_answer_model.dart';

abstract class FinaExamState {}

class FinaExamInitial extends FinaExamState {}

class FinaExamStatusStateLoading extends FinaExamState {}

class FinaExamStatusStateFailure extends FinaExamState {
  FinaExamStatusStateFailure(this.message);
  final String message;
}

class FinaExamStatusStateSuccess extends FinaExamState {
  FinaExamStatusStateSuccess(this.finalExamStatusModel);
  final FinalExamStatusModel finalExamStatusModel;
}

class StartFinaExamStateLoading extends FinaExamState {}

class StartFinaExamStateFailure extends FinaExamState {
  StartFinaExamStateFailure(this.message);
  final String message;
}

class StartFinaExamStateSuccess extends FinaExamState {
  StartFinaExamStateSuccess(this.message);
  final String message;
}

class ExamQuestionStateLoading extends FinaExamState {}

class ExamQuestionStateFailure extends FinaExamState {
  ExamQuestionStateFailure(this.message);
  final String message;
}

class ExamQuestionStateSuccess extends FinaExamState {
  ExamQuestionStateSuccess(this.finalExamQuestionModel);
  final FinalExamQuestionModel finalExamQuestionModel;
}

class SaveExamAnswerStateLoading extends FinaExamState {}

class SaveExamAnswerStateFailure extends FinaExamState {
  SaveExamAnswerStateFailure(this.message);
  final String message;
}

class SaveExamAnswerStateSuccess extends FinaExamState {
  SaveExamAnswerStateSuccess(this.saveExamAnswerModel);
  final SaveExamAnswerModel saveExamAnswerModel;
}

class SubmitExamStateLoading extends FinaExamState {}

class SubmitExamStateFailure extends FinaExamState {
  SubmitExamStateFailure(this.message);
  final String message;
}

class SubmitExamStateSuccess extends FinaExamState {
  SubmitExamStateSuccess(this.saveExamAnswerModel);
  final Map<String,dynamic> saveExamAnswerModel;
}

class ExamSubmissionStateLoading extends FinaExamState {}

class ExamSubmissionStateFailure extends FinaExamState {
  ExamSubmissionStateFailure(this.message);
  final String message;
}

class ExamSubmissionStateSuccess extends FinaExamState {
  ExamSubmissionStateSuccess(this.examSubmissionModel);
  final ExamSubmissionModel examSubmissionModel;
}

