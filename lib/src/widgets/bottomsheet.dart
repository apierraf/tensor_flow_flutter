import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import '/controller/controller.dart';

class MyBottomSheet {
  void showPicker(context) {
    final Controller c = Get.put(Controller());
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text('Galería'),
                  onTap: () {
                    c.getImageGalery();
                    Navigator.of(context).pop();
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Cámara'),
                  onTap: () {
                    c.getImageCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
