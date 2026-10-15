import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

@RoutePage()
class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({
    required this.title,
    this.link,
    this.isNetwork = true,
    this.pickedFile,
    super.key,
  });
  final String title;
  final String? link;
  final bool isNetwork;
  final File? pickedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: SfPdfViewerTheme(
        data: SfPdfViewerThemeData(
          backgroundColor: silverChalice.shade50,
          progressBarColor: orange,
        ),
        child: isNetwork
            ? SfPdfViewer.network(
                link!,
                onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to load PDF: ${details.error}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  Navigator.of(context).pop();
                },
              )
            : SfPdfViewer.file(pickedFile!),
      ),
    );
  }
}
