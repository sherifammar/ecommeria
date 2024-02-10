import 'dart:io';
import 'package:admin/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

imageUploadcamera() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}
// ============================

fileupLoadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "jpeg", "gif"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showBottommenu(imageUploadcamera(), fileupLoadGallery()) {
  Get.bottomSheet(
    Container(
        height: 150,
        color: ColorAPP.primaryColor,
        child: Column(
          children: [
            const Text('Choose image ', textScaleFactor: 2),
            ListTile(
              onTap: () {
                imageUploadcamera();
                Get.back(); // go to back of route
              },
              leading: const Icon(Icons.camera_alt),
              title: const Text(" take image by cameria"),
            ),
            ListTile(
              onTap: () {
                fileupLoadGallery();
                Get.back();
              },
              leading: const Icon(Icons.image),
              title: const Text("Choose image from galary"),
            )
          ],
        )),
    barrierColor: Colors.red[50],
    isDismissible: false,
  );
}
