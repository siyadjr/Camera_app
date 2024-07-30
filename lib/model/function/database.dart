import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:camera_app/model/photos.dart';

ValueNotifier<List<Photos>> imageListNotifier = ValueNotifier([]);
late Database _db;

Future<void> initialiseDatabase() async {
  try {
    _db = await openDatabase('image_db.db', version: 1,
        onCreate: ((_db, version) async {
      await _db
          .execute('CREATE TABLE images(id INTEGER PRIMARY KEY,image TEXT)');
      await getAllImages();
    }));
  } catch (e) {
    print('Error initializing database: $e');
   
  }
}

Future<void> getAllImages() async {
  try {
    final List<Map<String, dynamic>> _values =
        await _db.rawQuery('SELECT * FROM images');

    List<Photos> images = [];
    _values.forEach((element) {
      images.add(Photos.fromMap(element));
    });
    imageListNotifier.value = images;
    imageListNotifier.notifyListeners();
  } catch (e) {
    print('Error fetching images from database: $e');
    // Handle error here
  }
}

Future<void> addImage(Photos value) async {
  try {
    await _db.rawInsert('INSERT INTO images(image) VALUES(?) ', [value.image]);
    await getAllImages();
  } catch (e) {
    print('Error adding image to database: $e');
  }
}

Future<void> deleteImage(Photos value) async {
  try {
    await _db.rawDelete('DELETE FROM images WHERE image LIKE ?', [value.image]);
    await getAllImages();
  } catch (e) {
    print('Error deleting image from database: $e');
  
  }
}
