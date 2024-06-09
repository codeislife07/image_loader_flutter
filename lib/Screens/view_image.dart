import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewImageScreen extends StatelessWidget {
  ImageProvider iMageProvider;
  ViewImageScreen({super.key, required this.iMageProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: iMageProvider
            // ),
            ),
        child: PhotoView(
          imageProvider: iMageProvider,
        ),
      ),
    );
  }
}
