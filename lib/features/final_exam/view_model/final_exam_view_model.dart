import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/exam_question_params.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/save_exam_params.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/repositories/final_exam_repositories.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/view_model/fina_exam_state.dart';

final finalExamViewModelNotifier =
StateNotifierProvider<FinalExamViewModel, FinaExamState>(
      (ref) => FinalExamViewModel(ref.read(finalExamRepositoriesProvider)),
);


class FinalExamViewModel extends StateNotifier<FinaExamState> {
  FinalExamViewModel(this.finalExamRepositories)
      : super(FinaExamInitial());

  final FinalExamRepositories finalExamRepositories;

  Future<void> finalExamStatus({
    required String courseId,
    required String examId,}) async {

    state = FinaExamStatusStateLoading();
    final result = await finalExamRepositories
        .finalExamStatus(courseId: courseId,examId: examId);

    result.fold((errorMessage) {
      state = FinaExamStatusStateFailure(errorMessage);
    }, (finalExamStatusModel) {
      state = FinaExamStatusStateSuccess(finalExamStatusModel);
    },
    );
  }

  Future<void> startFinalExam({
    required String courseId,
    required String examId,}) async {
    
    state = StartFinaExamStateLoading();
    final result = await finalExamRepositories
        .startFinalExam(courseId: courseId,examId: examId);

    result.fold((errorMessage) {
      state = StartFinaExamStateFailure(errorMessage);
      }, (successMessage) {
      state = StartFinaExamStateSuccess('Success');
      },
    );
  }

  Future<void> getExamQuestion({
    required ExamQuestionParams examQuestionParams,
    required int questionNo,}) async {

    state = ExamQuestionStateLoading();
    final result = await finalExamRepositories
        .getExamQuestion(examQuestionParams: examQuestionParams,
        questionNo: questionNo,);

    result.fold((errorMessage) {
      state = ExamQuestionStateFailure(errorMessage);
    }, (finalExamQuestionModel) {
      state = ExamQuestionStateSuccess(finalExamQuestionModel);
    },
    );
  }

  Future<void> saveAnswer({
    required SaveExamParams saveExamParams,
    required int questionNo,}) async {

    state = SaveExamAnswerStateLoading();
    final result = await finalExamRepositories
        .saveAnswer(saveExamParams: saveExamParams,questionNo: questionNo);

    result.fold((errorMessage) {
      state = SaveExamAnswerStateFailure(errorMessage);
    }, (saveExamAnswerModel) {
      state = SaveExamAnswerStateSuccess(saveExamAnswerModel);
    },
    );
  }

  Future<void> submitExam({
  required String courseId,required String examId,}) async {

    state = SubmitExamStateLoading();
    final result = await finalExamRepositories
        .submitExam(courseId: courseId,examId: examId);

    result.fold((errorMessage) {
      state = SubmitExamStateFailure(errorMessage);
    }, (saveExamAnswerModel) {
      state = SubmitExamStateSuccess(saveExamAnswerModel);
    },
    );
  }

  Future<void> submissionDetails({
    required String courseId,
    required String examId,}) async {

    state = ExamSubmissionStateLoading();
    final result = await finalExamRepositories
        .submissionDetails(courseId: courseId,examId: examId);

    result.fold((errorMessage) {
      state = ExamSubmissionStateFailure(errorMessage);
    }, (examSubmissionModel) {
      state = ExamSubmissionStateSuccess(examSubmissionModel);
    },
    );
  }

}
