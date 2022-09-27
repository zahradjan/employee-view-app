import 'dart:io';

import 'package:get/get.dart';
import 'package:mobilesoft_flutter_test/controllers/employee_api_provider.dart';

class EmployeesController extends GetxController {
  EmployeeProvider? employeeProvider;
  var isDataFetching = false.obs;
  getAPI() async {
    try {
      isDataFetching(true);
      HttpResponse response =
          await employeeProvider!.fetchEmployees() as HttpResponse;

      if (response.statusCode == 200) {
        //TODO: parse employee
      }
    } catch (e) {
      //TODO: snackbar to show user
      printError(info: 'Error while getting data is $e');
    } finally {
      isDataFetching(false);
    }
  }
}
