import 'package:camera_app/model/function/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:camera_app/model/function/database.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialiseDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
