import 'dart:io';

import 'package:get/get.dart';
import 'package:mask_tensorflow/utils/const.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tflite/tflite.dart';

class Controller extends GetxController {
  RxString imagePath = ''.obs;
  late File image;

  final _picker = ImagePicker();

  RxString result = ''.obs;

  @override
  void onInit() {
    image = new File(imagePath.value);
    super.onInit();
    loadModel().then((value) {});
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  classifyImage(File image) async {
    //this function runs the model on the image
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 36, //the amout of categories our neural network can predict
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    output!.forEach((element) {
      result.value = element['label'];
      print(result);
    });
    update();
  }

  String withMask() {
    return result.value == 'with_mask'
        ? Const.iconNames[0]
        : Const.iconNames[1];
  }

  Future<void> getImageCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath.value = pickedFile.path;
      print(imagePath);
      classifyImage(image);
      update();
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageGalery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath.value = pickedFile.path;
      print(imagePath);
      classifyImage(image);
      update();
    } else {
      print('No image selected.');
    }
  }
}
