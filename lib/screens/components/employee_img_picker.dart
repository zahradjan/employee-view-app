import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilesoft_flutter_test/controllers/employees_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// : FileImage(File(employeesController.profilePicPath.value))
class EmployeeImagePicker extends StatelessWidget {
  EmployeeImagePicker({Key? key}) : super(key: key);
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  EmployeesController employeesController = Get.find();
  Future<void> pickImage(ImageSource imageSource) async {
    try {
      var image = await imagePicker.pickImage(source: imageSource);
      if (image == null) return;
      employeesController.setImage(image);
      // employeesController.setProfileImagePath(image.path);
    } on PlatformException catch (e) {
      //TODO:Show snackbar
      Get.snackbar(
        'Failed to pick image',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
      print("Failed to pick image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.camera_alt),
                      Text('Camera', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  onTap: () {
                    Get.back();
                    pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.image),
                      Text('Gallery', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  onTap: () {
                    Get.back();
                    pickImage(ImageSource.gallery);
                  },
                )
              ],
            ),
          ),
        );
        // pickImage();
        print("Tap");
      },
      child: Stack(
        children: [
          Obx(() => SizedBox(
              width: 150,
              height: 150,
              child: employeesController.isImagePathSet.value != true
                  ? Icon(Icons.person, size: 150)
                  : Image.file(
                      File(employeesController.empPhoto.value!.path)))),
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
