import 'package:flutter/material.dart';

class AppHelpers {
  static String defaultNetworkImage =
      'https://pixabay.com/vectors/image-pictures-icon-photo-1271454/';

  static void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }

  static String removeHtmlTags(String htmlString) {
    final regExp = RegExp('<[^>]*>', multiLine: true);
    final cleanedString = htmlString.replaceAll(regExp, '');
    return cleanedString.replaceAll('&nbsp;', ' ');
  }

  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}
