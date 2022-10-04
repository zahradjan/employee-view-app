import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EmployeeController extends GetxController {
  var isImagePathSet = false.obs;
  var empName = "".obs;
  var empAddress = "".obs;
  var empDepartment = "".obs;
  var empSalary = 0.obs;
  Rx<XFile?> empPhoto = Rx<XFile?>(null);
  set setEmpName(value) => empName.value = value;
  set setEmpAddress(value) => empAddress.value = value;
  set setEmpDepartment(value) => empDepartment.value = value;
  set setEmpSalary(value) => empSalary.value = value;

  void setImage(XFile image) {
    empPhoto.value = image;
    isImagePathSet.value = true;
  }
}
