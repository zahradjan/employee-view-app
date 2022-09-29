import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilesoft_flutter_test/controllers/employees_controller.dart';

// : FileImage(File(employeesController.profilePicPath.value))
class EmployeeImagePicker extends StatelessWidget {
  EmployeeImagePicker({Key? key}) : super(key: key);
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  EmployeesController employeesController = Get.find();
  Future<void> pickImage() async {
    try {
      var image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image == null) return;
      employeesController.setProfileImagePath(image.path);
    } on PlatformException catch (e) {
      //TODO:Show snackbar
      print("Failed to pick image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        pickImage();
        print("Tap");
      },
      child: Stack(
        children: [
          Obx(() => SizedBox(
              width: 150,
              height: 150,
              child: employeesController.isImagePathSet.value != true
                  ? Icon(Icons.person, size: 150)
                  : Image.file(File(employeesController.imagePath.value)))),
          AddPhotoWidget()
        ],
      ),
    );
  }
}

class AddPhotoWidget extends StatelessWidget {
  const AddPhotoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      right: 0,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3),
            color: Theme.of(context).scaffoldBackgroundColor),
        child: Icon(Icons.add_a_photo, size: 30.0, color: Colors.black),
      ),
    );
  }
}
