// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackFormModel _$FeedbackFormModelFromJson(Map<String, dynamic> json) =>
    FeedbackFormModel(
      form: json['form'] == null
          ? null
          : Form.fromJson(json['form'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbackFormModelToJson(FeedbackFormModel instance) =>
    <String, dynamic>{
      'form': instance.form,
    };

Form _$FormFromJson(Map<String, dynamic> json) => Form(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      usage: json['usage'] as String?,
      recipient: json['recipient'] as String?,
      courseId: json['courseId'] as String?,
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FormToJson(Form instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'usage': instance.usage,
      'recipient': instance.recipient,
      'courseId': instance.courseId,
      'content': instance.content,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      id: json['_id'] as String?,
      question: json['question'] as String?,
      type: json['type'] as String?,
      isMandatory: json['isMandatory'] as bool?,
      allowMultipleAnswer: json['allowMultipleAnswer'] as bool?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      scaleCount: (json['scaleCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'type': instance.type,
      'isMandatory': instance.isMandatory,
      'allowMultipleAnswer': instance.allowMultipleAnswer,
      'options': instance.options,
      'scaleCount': instance.scaleCount,
    };
