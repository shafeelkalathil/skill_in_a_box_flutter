import 'package:skill_in_a_box_flutter/features/my_courses/model/curriculum_model/curriculum_model.dart';

extension CurriculumModelExtension on CurriculumModel {
  bool canAccessSection(String sectionId) {
    if (curriculum?.sections == null || currentSection == null) {
      throw Exception('Curriculum or current section is not initialized');
    }

    final currentIndex = curriculum!.sections!.indexWhere(
      (section) => section.id == currentSection,
    );

    final targetIndex = curriculum!.sections!.indexWhere(
      (section) => section.id == sectionId,
    );

    if (currentIndex == -1 || targetIndex == -1) {
      throw Exception('Section not found');
    }

    return targetIndex <= currentIndex;
  }
}
