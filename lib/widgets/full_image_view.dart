import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullImageView extends StatelessWidget {
  final String imagePath;

  const FullImageView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: PhotoView(
        imageProvider: imagePath.startsWith('assets/')
            ? AssetImage(imagePath)
            : FileImage(File(imagePath)) as ImageProvider,
      ),
    );
  }
}
