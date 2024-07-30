import 'dart:io';

import 'package:camera_app/model/photos.dart';
import 'package:flutter/material.dart';

class DetailVIew extends StatelessWidget {
  final Photos photo;
  final  index;

  const DetailVIew({required this.photo, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    // Use this.image to access the passed data and display details
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 190, 218, 231),
        title: Center(child: Text('Photo $index Full View')),
      ),
      backgroundColor: Colors.black,
      body: Center(child: Image.file(File(photo.image)) // Example usage
          ),
    );
  }
}
