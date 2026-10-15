import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

@RoutePage()
class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({required this.imageUrl,super.key});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: PhotoView(
          imageProvider: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
