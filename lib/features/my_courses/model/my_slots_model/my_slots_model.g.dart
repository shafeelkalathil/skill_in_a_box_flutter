// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_slots_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MySlotsModel _$MySlotsModelFromJson(Map<String, dynamic> json) => MySlotsModel(
      slot: (json['slot'] as List<dynamic>?)
          ?.map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MySlotsModelToJson(MySlotsModel instance) =>
    <String, dynamic>{
      'slot': instance.slot,
    };

Slot _$SlotFromJson(Map<String, dynamic> json) => Slot(
      id: json['_id'] as String?,
      startDateTime: json['startDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      status: json['status'] as String?,
      facilitatorDetails: json['facilitatorDetails'] == null
          ? null
          : FacilitatorDetails.fromJson(
              json['facilitatorDetails'] as Map<String, dynamic>),
      courseDetails: json['courseDetails'] == null
          ? null
          : CourseDetails.fromJson(
              json['courseDetails'] as Map<String, dynamic>),
      availableFor: (json['availableFor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      '_id': instance.id,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'status': instance.status,
      'facilitatorDetails': instance.facilitatorDetails,
      'courseDetails': instance.courseDetails,
      'availableFor': instance.availableFor,
    };

FacilitatorDetails _$FacilitatorDetailsFromJson(Map<String, dynamic> json) =>
    FacilitatorDetails(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$FacilitatorDetailsToJson(FacilitatorDetails instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

CourseDetails _$CourseDetailsFromJson(Map<String, dynamic> json) =>
    CourseDetails(
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CourseDetailsToJson(CourseDetails instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
