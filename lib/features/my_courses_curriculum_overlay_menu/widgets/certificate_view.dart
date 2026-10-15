import 'package:auto_route/annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

@RoutePage()
class CertificateViewPage extends StatelessWidget {
  const CertificateViewPage({required this.pdfUrl, super.key});

  final String pdfUrl;

  Future<void> _downloadPdf(BuildContext context) async {
    try {
      final dio = Dio();
      final directory = await getDownloadsDirectory();
      final downloadsPath = '${directory!.path}/Download';
      final filePath = '$downloadsPath/certificate.pdf';

      // Start the download
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Downloading...')),
      );

      await dio.download(
        pdfUrl,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = (received / total * 100).toStringAsFixed(0);
            debugPrint('Download Progress: $progress%');
          }
        },
      );

      // Success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloaded to $filePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to download PDF')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Course Certificate'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:  PDF(
                backgroundColor: dark ? Colors.black : Colors.white,
              ).fromUrl(
                pdfUrl,
                placeholder: (double progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress / 100,
                    color: orange.shade500,
                  ),
                ),
                errorWidget: (dynamic error) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, color: Colors.red, size: 48),
                      const SizedBox(height: 16),
                      Text(
                        'Error loading PDF',
                        style: TextStyle(
                          color: Colors.red.shade500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => const PDF().fromUrl(pdfUrl),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: context.screenWidth*0.6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () => _downloadPdf(context),
                  child: const Text('Download Certificate'),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
