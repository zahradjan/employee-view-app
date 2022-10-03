import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilesoft_flutter_test/controllers/employee_api_provider.dart';
import 'package:mobilesoft_flutter_test/dao/employee_dao.dart';
import 'package:mobilesoft_flutter_test/db/database.dart';
import 'package:mobilesoft_flutter_test/models/employee.dart';
import 'package:mobilesoft_flutter_test/screens/components/employee_img_picker.dart';
import 'package:mobilesoft_flutter_test/screens/employees_view_screen.dart';

class EmployeesController extends GetxController {
  EmployeeProvider employeeProvider = EmployeeProvider();
  EmployeeDao? employeeDao;
  List<Employee> employees = <Employee>[].obs;
  //TODO: this better for uniqueness
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

  @override
  Future<void> onInit() async {
    final database =
        await $FloorAppDatabase.databaseBuilder("employee_database.db").build();

    employeeDao = database.employeeDao;
    await getEmployees();
    var dbResponse = await employeeDao!.getAllEmployees();
    // if (dbResponse == []) {
    // dbResponse = await employeeDao!.getAllEmployees();
    // }
    employees.assignAll(dbResponse);

    super.onInit();
  }

  getEmployees() async {
    try {
      var response = await employeeProvider.fetchEmployees();
      print(response);
      if (response.statusCode == 200) {
        var result = response.body;
        result.forEach((employee) {
          employeeDao!.addNewEmployee(Employee.fromJson(employee));
        });
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
      printError(info: 'Error while getting data $e');
    }
  }

  createNewEmployee() async {
    try {
      var formData = FormData({
        'json': jsonEncode({
          "name": empName.value,
          "address": empAddress.value,
          "department": empDepartment.value,
          "salary": empSalary.value
        }),
      });
      if (isImagePathSet.value == true) {
        formData.files.add(MapEntry(
            "photo",
            MultipartFile(File(empPhoto.value!.path),
                filename: empPhoto.value!.name)));
      }
      // print(formData.fields.first);
      var response = await employeeProvider.createNewEmployee(formData);
      print(response);

      if (response.statusCode == 200) {
        try {
          var employee = Employee.fromJson(response.body);
          employeeDao!.addNewEmployee(employee);
          employees.add(employee);
          Get.snackbar("Employee created", "Employee successfully created",
              snackPosition: SnackPosition.BOTTOM);

          Get.back();
        } catch (e) {
          Get.snackbar("Error saving employee", "$e",
              snackPosition: SnackPosition.BOTTOM);
        }
      }

      if (response.statusCode == 400) {
        //TODO:Maybe alert view
        Get.snackbar("Error creating employee ${response.statusCode}",
            response.body['message'],
            snackPosition: SnackPosition.BOTTOM);
      }
      if (response.statusCode == 403) {
        Get.snackbar("Error creating employee", response.body['message'],
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error creating employee", "$e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void resetNewEmployeeValues() {
    setEmpName = "";
    setEmpAddress = "";
    setEmpDepartment = "";
    setEmpSalary = 0;
    isImagePathSet = false.obs;
    empPhoto.value = null;
  }
}
