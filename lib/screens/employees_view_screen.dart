import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilesoft_flutter_test/controllers/employees_controller.dart';
import 'package:mobilesoft_flutter_test/screens/employee_list_card.dart';
import 'package:mobilesoft_flutter_test/screens/new_employee_card.dart';

class EmployeesViewScreen extends StatefulWidget {
  const EmployeesViewScreen({Key? key}) : super(key: key);

  @override
  State<EmployeesViewScreen> createState() => _EmployeesViewScreenState();
}

class _EmployeesViewScreenState extends State<EmployeesViewScreen> {
  EmployeesController employeesController = Get.put(EmployeesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Obx(() => employeesController.employees.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.only(top: 4.0),
                itemCount: employeesController.employees.length,
                itemBuilder: ((context, index) {
                  return EmployeeListCard(
                      emp: employeesController.employees[index]);
                }))
            : const Center(child: CircularProgressIndicator())));
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: const Text("Employees"),
    automaticallyImplyLeading: false,
    centerTitle: true,
    // iconTheme:IconTheme(data: IconThemeData(size: 10), child: Ic),
    actions: [
      IconButton(
          alignment: Alignment.centerLeft,
          iconSize: 50,
          onPressed: () {
            Get.to(() => NewEmployeeCard());
          },
          icon: const Icon(
            Icons.add,
          ))
    ],
  );
}
