import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilesoft_flutter_test/controllers/employee_api_provider.dart';
import 'package:mobilesoft_flutter_test/controllers/employee_controller.dart';
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

  @override
  Future<void> onInit() async {
    final database =
        await $FloorAppDatabase.databaseBuilder("employee_database.db").build();

    employeeDao = database.employeeDao;
    var dbResponse = await employeeDao!.getAllEmployees();
    if (dbResponse.isEmpty) {
      await getEmployees();
      dbResponse = await employeeDao!.getAllEmployees();
    }
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

  createNewEmployee(EmployeeController employeeController) async {
    var employee = {
      "name": employeeController.empName.value,
      "address": employeeController.empAddress.value,
      "department": employeeController.empDepartment.value,
      "salary": employeeController.empSalary.value
    };
    employee.removeWhere((key, value) => value == "" || value == 0);

    try {
      var formData = FormData({
        'json': jsonEncode(employee),
      });
      if (employeeController.isImagePathSet.value == true) {
        formData.files.add(MapEntry(
            "photo",
            MultipartFile(File(employeeController.empPhoto.value!.path),
                filename: employeeController.empPhoto.value!.name)));
      }

      var response = await employeeProvider.createNewEmployee(formData);
      print(response);

      if (response.statusCode == 200) {
        try {
          var employee = Employee.fromJson(response.body);
          employeeDao!.addNewEmployee(employee);
          employees.add(employee);
          Get.back();
          Get.snackbar("Employee created", "Employee successfully created",
              snackPosition: SnackPosition.BOTTOM);
        } catch (e) {
          Get.snackbar("Error saving employee", "$e",
              snackPosition: SnackPosition.BOTTOM);
        }
      }

      if (response.statusCode == 400) {
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
}
