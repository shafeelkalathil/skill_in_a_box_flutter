class SectionUiModel {
  SectionUiModel({
    required this.type,
    required this.id,
    required this.title,
    this.isLocked = true,
  });
  final String title;
  final String type;
  final String id;
  final bool isLocked;
}
