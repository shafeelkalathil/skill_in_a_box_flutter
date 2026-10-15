// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_courses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCourseModel _$MyCourseModelFromJson(Map<String, dynamic> json) =>
    MyCourseModel(
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Courses.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyCourseModelToJson(MyCourseModel instance) =>
    <String, dynamic>{
      'courses': instance.courses,
    };

Courses _$CoursesFromJson(Map<String, dynamic> json) => Courses(
      id: json['_id'] as String?,
      hasBatchId: json['hasBatchId'] as bool?,
      courseDetails: json['courseDetails'] == null
          ? null
          : CourseDetails.fromJson(
              json['courseDetails'] as Map<String, dynamic>),
      status: json['status'] as String?,
      isCertified: json['isCertified'] as bool?,
      progress: json['progress'] == null
          ? null
          : Progress.fromJson(json['progress'] as Map<String, dynamic>),
      totalCombinedCount: (json['totalCombinedCount'] as num?)?.toInt(),
      pricing: json['pricing'] == null
          ? null
          : Pricing.fromJson(json['pricing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoursesToJson(Courses instance) => <String, dynamic>{
      '_id': instance.id,
      'hasBatchId': instance.hasBatchId,
      'courseDetails': instance.courseDetails,
      'status': instance.status,
      'isCertified': instance.isCertified,
      'progress': instance.progress,
      'totalCombinedCount': instance.totalCombinedCount,
      'pricing': instance.pricing,
    };

CourseDetails _$CourseDetailsFromJson(Map<String, dynamic> json) =>
    CourseDetails(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      trailer: (json['trailer'] as List<dynamic>?)
          ?.map((e) => Trailer.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
      courseOutput: (json['courseOutput'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requirement: (json['requirement'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      curriculum: json['curriculum'] == null
          ? null
          : Curriculum.fromJson(json['curriculum'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CourseDetailsToJson(CourseDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'trailer': instance.trailer,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'courseOutput': instance.courseOutput,
      'requirement': instance.requirement,
      'curriculum': instance.curriculum,
      'type': instance.type,
    };

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      name: json['name'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      link: json['link'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'type': instance.type,
      'link': instance.link,
      '_id': instance.id,
    };

Curriculum _$CurriculumFromJson(Map<String, dynamic> json) => Curriculum(
      sections: (json['sections'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CurriculumToJson(Curriculum instance) =>
    <String, dynamic>{
      'sections': instance.sections,
    };

Progress _$ProgressFromJson(Map<String, dynamic> json) => Progress(
      currentLesson: json['currentLesson'] == null
          ? null
          : CurrentLesson.fromJson(
              json['currentLesson'] as Map<String, dynamic>),
      currentSection: json['currentSection'] == null
          ? null
          : CurrentSection.fromJson(
              json['currentSection'] as Map<String, dynamic>),
      totalContent: (json['totalContent'] as num?)?.toInt(),
      completedContent: (json['completedContent'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProgressToJson(Progress instance) => <String, dynamic>{
      'currentLesson': instance.currentLesson,
      'currentSection': instance.currentSection,
      'totalContent': instance.totalContent,
      'completedContent': instance.completedContent,
    };

CurrentLesson _$CurrentLessonFromJson(Map<String, dynamic> json) =>
    CurrentLesson(
      lessonId: json['lessonId'] as String?,
      lessonTitle: json['lessonTitle'] as String?,
    );

Map<String, dynamic> _$CurrentLessonToJson(CurrentLesson instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'lessonTitle': instance.lessonTitle,
    };

CurrentSection _$CurrentSectionFromJson(Map<String, dynamic> json) =>
    CurrentSection(
      sectionId: json['sectionId'] as String?,
      sectionTitle: json['sectionTitle'] as String?,
    );

Map<String, dynamic> _$CurrentSectionToJson(CurrentSection instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'sectionTitle': instance.sectionTitle,
    };

Pricing _$PricingFromJson(Map<String, dynamic> json) => Pricing(
      type: json['type'] as String?,
      indian: json['indian'] == null
          ? null
          : Indian.fromJson(json['indian'] as Map<String, dynamic>),
      overseas: json['overseas'] == null
          ? null
          : Overseas.fromJson(json['overseas'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PricingToJson(Pricing instance) => <String, dynamic>{
      'type': instance.type,
      'indian': instance.indian,
      'overseas': instance.overseas,
    };

Indian _$IndianFromJson(Map<String, dynamic> json) => Indian(
      totalAmount: (json['totalAmount'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      registrationAmount: (json['registrationAmount'] as num?)?.toInt(),
      courseFee: (json['courseFee'] as num?)?.toInt(),
      installment: json['installment'] == null
          ? null
          : Installment.fromJson(json['installment'] as Map<String, dynamic>),
      loan: json['loan'] == null
          ? null
          : Loan.fromJson(json['loan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndianToJson(Indian instance) => <String, dynamic>{
      'totalAmount': instance.totalAmount,
      'discount': instance.discount,
      'registrationAmount': instance.registrationAmount,
      'courseFee': instance.courseFee,
      'installment': instance.installment,
      'loan': instance.loan,
    };

Installment _$InstallmentFromJson(Map<String, dynamic> json) => Installment(
      isAvailable: json['isAvailable'] as bool?,
      totalCount: (json['totalCount'] as num?)?.toInt(),
      installments: (json['installments'] as List<dynamic>?)
          ?.map((e) => Installments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InstallmentToJson(Installment instance) =>
    <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'totalCount': instance.totalCount,
      'installments': instance.installments,
    };

Installments _$InstallmentsFromJson(Map<String, dynamic> json) => Installments(
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InstallmentsToJson(Installments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };

Loan _$LoanFromJson(Map<String, dynamic> json) => Loan(
      isAvailable: json['isAvailable'] as bool?,
      document: (json['document'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LoanToJson(Loan instance) => <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'document': instance.document,
    };

Overseas _$OverseasFromJson(Map<String, dynamic> json) => Overseas(
      totalAmount: (json['totalAmount'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      registrationAmount: (json['registrationAmount'] as num?)?.toInt(),
      courseFee: (json['courseFee'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OverseasToJson(Overseas instance) => <String, dynamic>{
      'totalAmount': instance.totalAmount,
      'discount': instance.discount,
      'registrationAmount': instance.registrationAmount,
      'courseFee': instance.courseFee,
    };
