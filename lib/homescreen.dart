// homescreen.dart
import 'package:flutter/material.dart';
import 'package:camera_app/gallery.dart';
import 'package:camera_app/model/function/database.dart';
import 'package:camera_app/model/photos.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getAllImages();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 190, 218, 231),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'PHOTO ALBUM',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openCamera();
        },
        child: const Icon(Icons.camera_alt),
      ),
      body: const GalleyScreen(),
    );
  }

  Future<void> openCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      Photos photo = Photos(image: pickedImage.path);
      await addImage(photo);
    }
  }
}
