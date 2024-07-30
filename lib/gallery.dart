import 'dart:io';
import 'package:camera_app/detailview.dart';
import 'package:camera_app/model/photos.dart';
import 'package:flutter/material.dart';
import 'package:camera_app/model/function/database.dart';

class GalleyScreen extends StatefulWidget {
  const GalleyScreen({super.key});

  @override
  State<GalleyScreen> createState() => _GalleyScreenState();
}

class _GalleyScreenState extends State<GalleyScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder(
        valueListenable: imageListNotifier,
        builder: (context, value, child) {
          return value.isEmpty
              ? const Center(
                  child: Text("No Photos"),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final currentindex = index + 1;
                    final data = value[index];
                    final imagepath = File(data.image);

                    return GridTile(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => DetailVIew(
                                      photo: data, index: currentindex))));
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(imagepath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: IconButton(
                                onPressed: () {
                                  deleteCormfirmation(context, data);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }

  Future<void> deleteCormfirmation(BuildContext context, Photos data) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const  Text('Delete Image '),
          content:const Text('Are you sure do you want delete?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  deleteImage(data);
                  Navigator.pop(context);
                },
                child: const Text('Delete'))
          ],
        );
      },
    );
  }
}
