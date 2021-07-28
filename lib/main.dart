import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_tensorflow/src/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Detector mascara',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
