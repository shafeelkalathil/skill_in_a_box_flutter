extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

   String fromCamelCase() {
    return replaceAllMapped(
      RegExp('(?<=[a-z])[A-Z]'),
      (Match m) => ' ${m.group(0)}',
    ).toLowerCase();
  }

  String fromCamelCaseToTitleCase() {
    return fromCamelCase()
        .split(' ')
        .map((word) => word.capitalize())
        .join(' ');
  }

  String fromCamelCaseToSentenceCase() {
    return fromCamelCase().capitalize();
  }

  String toTitleCaseFromSnakeCase() {
    if (isEmpty) return this;

    final words = split('_');

    final titleCaseWords = words.map((word) {
      if (word.isEmpty) return '';
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).toList();
    return titleCaseWords.join(' ');
  }
}
