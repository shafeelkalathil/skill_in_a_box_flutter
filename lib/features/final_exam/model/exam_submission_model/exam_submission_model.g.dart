// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_submission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamSubmissionModel _$ExamSubmissionModelFromJson(Map<String, dynamic> json) =>
    ExamSubmissionModel(
      exam: Exam.fromJson(json['exam'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamSubmissionModelToJson(
        ExamSubmissionModel instance) =>
    <String, dynamic>{
      'exam': instance.exam,
    };

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
      id: json['_id'] as String,
      status: json['status'] as String,
      timeTaken: (json['timeTaken'] as num).toInt(),
      submittedTime: json['submittedTime'] as String,
      obtainedMark: (json['obtainedMark'] as num).toInt(),
      name: json['name'] as String,
      totalMark: (json['totalMark'] as num).toInt(),
      studentId: json['studentId'] as String,
      studentName: json['studentName'] as String,
      studentProfilePic: json['studentProfilePic'] as String,
      feedback: json['feedback'] as String,
      result: (json['result'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      '_id': instance.id,
      'status': instance.status,
      'timeTaken': instance.timeTaken,
      'submittedTime': instance.submittedTime,
      'obtainedMark': instance.obtainedMark,
      'name': instance.name,
      'totalMark': instance.totalMark,
      'studentId': instance.studentId,
      'studentName': instance.studentName,
      'studentProfilePic': instance.studentProfilePic,
      'feedback': instance.feedback,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      question: json['question'] as String,
      answer:
          (json['answer'] as List<dynamic>).map((e) => e as String).toList(),
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      id: json['_id'] as String,
      questionScore: (json['questionScore'] as num).toInt(),
      submittedAnswer: (json['submittedAnswer'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'submittedAnswer': instance.submittedAnswer,
      'options': instance.options,
      'type': instance.type,
      '_id': instance.id,
      'questionScore': instance.questionScore,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      option: json['option'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'option': instance.option,
      'id': instance.id,
    };
