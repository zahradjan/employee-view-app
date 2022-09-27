import 'package:get/get.dart';

class EmployeeProvider extends GetConnect {
  Future<Response> fetchEmployees() =>
      get('http://testapp.mobilesoft.cz/api/employees');

  Future<Response> getEmployee(int id) =>
      get('http://testapp.mobilesoft.cz/api/employees/$id');

  Future<Response> createNewEmployee(Map data) =>
      post("http://testapp.mobilesoft.cz/api/employees", data);
}
