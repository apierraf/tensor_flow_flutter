import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import '/controller/controller.dart';
import 'package:mask_tensorflow/src/widgets/bottomsheet.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        title: Text('Detector de mascara'),
        backgroundColor: Colors.red[400],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 3,
                child: Obx(
                  () => c.imagePath.value == ''
                      ? Container(
                          width: Get.width,
                          height: Get.height * 0.5,
                          child: Lottie.asset('assets/images/coronamask.json'),
                        )
                      : Container(
                          width: Get.width,
                          height: Get.height * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(c.image),
                            ),
                          ),
                        ),
                ),
              ),
              MaterialButton(
                onPressed: () => MyBottomSheet().showPicker(context),
                child: Icon(
                  Icons.camera_alt_sharp,
                  color: Colors.white,
                ),
                shape: StadiumBorder(),
                color: Colors.red[400],
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: Obx(
                  () => SvgPicture.asset(
                    c.withMask(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
