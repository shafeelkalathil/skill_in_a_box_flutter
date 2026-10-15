// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubt_box_section_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoubtBoxSectionDetailsModel _$DoubtBoxSectionDetailsModelFromJson(
        Map<String, dynamic> json) =>
    DoubtBoxSectionDetailsModel(
      doubtBoxData: (json['doubtBoxData'] as List<dynamic>?)
          ?.map((e) => DoubtBoxData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoubtBoxSectionDetailsModelToJson(
        DoubtBoxSectionDetailsModel instance) =>
    <String, dynamic>{
      'doubtBoxData': instance.doubtBoxData,
    };

DoubtBoxData _$DoubtBoxDataFromJson(Map<String, dynamic> json) => DoubtBoxData(
      id: json['_id'] as String?,
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      answerType: json['answerType'] as String?,
      likes: (json['likes'] as num?)?.toInt(),
      dislikes: (json['dislikes'] as num?)?.toInt(),
      isPublic: json['isPublic'] as bool?,
      answerFile: json['answerFile'] == null
          ? null
          : AnswerFile.fromJson(json['answerFile'] as Map<String, dynamic>),
      isLiked: json['isLiked'] as bool?,
      isDisliked: json['isDisliked'] as bool?,
    );

Map<String, dynamic> _$DoubtBoxDataToJson(DoubtBoxData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'answerType': instance.answerType,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'isPublic': instance.isPublic,
      'answerFile': instance.answerFile,
      'isLiked': instance.isLiked,
      'isDisliked': instance.isDisliked,
    };

AnswerFile _$AnswerFileFromJson(Map<String, dynamic> json) => AnswerFile(
      name: json['name'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      link: json['link'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AnswerFileToJson(AnswerFile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'type': instance.type,
      'link': instance.link,
      'id': instance.id,
    };
