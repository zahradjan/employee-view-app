import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:mobilesoft_flutter_test/controllers/employee_api_provider.dart';
import 'package:mobilesoft_flutter_test/dao/employee_dao.dart';
import 'package:mobilesoft_flutter_test/db/database.dart';
import 'package:mobilesoft_flutter_test/models/employee.dart';

class EmployeesController extends GetxController {
  EmployeeProvider employeeProvider = EmployeeProvider();
  EmployeeDao? employeeDao;
  List<Employee> employees = <Employee>[].obs;
  var isDataFetching = false.obs;
  var isImagePathSet = false.obs;
  var imagePath = "".obs;

  void setProfileImagePath(String path) {
    imagePath.value = path;
    isImagePathSet.value = true;
  }

  @override
  Future<void> onInit() async {
    await getEmployees();
    final database =
        await $FloorAppDatabase.databaseBuilder("employee_database.db").build();

    employeeDao = database.employeeDao;
    var dbResponse = await employeeDao!.getAllEmployees();
    employees.assignAll(dbResponse);

    super.onInit();
  }

  getEmployees() async {
    try {
      isDataFetching(true);
      var response = await employeeProvider.fetchEmployees();
      print(response);
      if (response.statusCode == 200) {
        //TODO: parse employee
        var result = response.body;
        print(result.runtimeType);
        var jsonDecoded = jsonDecode(result);
        print(jsonDecoded);

        print(result);
        result.forEach((employee) {
          employeeDao!.addNewEmployee(Employee.fromJson(employee));
        });
      }
    } catch (e) {
      //TODO: snackbar to show user
      GetSnackBar(title: "Error", message: "$e");
      printError(info: 'Error while getting data is $e');
    } finally {
      isDataFetching(false);
    }
  }
}
