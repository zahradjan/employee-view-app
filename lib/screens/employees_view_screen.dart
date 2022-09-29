import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobilesoft_flutter_test/controllers/employees_controller.dart';
import 'package:mobilesoft_flutter_test/dao/employee_dao.dart';
import 'package:mobilesoft_flutter_test/models/employee.dart';
import 'package:mobilesoft_flutter_test/screens/employee_list_card.dart';
import 'package:mobilesoft_flutter_test/screens/new_employee_card.dart';

class EmployeesViewScreen extends StatefulWidget {
  const EmployeesViewScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<EmployeesViewScreen> createState() => _EmployeesViewScreenState();
}

class _EmployeesViewScreenState extends State<EmployeesViewScreen> {
  EmployeesController employeesController = Get.put(EmployeesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Obx(() => employeesController.employeeDao.obs.value == null
          ? const Center(child: LinearProgressIndicator())
          : FutureBuilder(
              future: employeesController.employeeDao?.getAllEmployees(),
              // initialData: [],
              builder: (context, snapshot) {
                print(employeesController.employeeDao);
                print(snapshot);
                if (snapshot.hasData) {
                  var snapshotsEmployee = snapshot.data as List<Employee>;
                  return ListView.builder(
                      itemCount: snapshotsEmployee.length,
                      itemBuilder: ((context, index) {
                        print(snapshotsEmployee[index]);
                        return EmployeeListCard(emp: snapshotsEmployee[index]);
                      }));
                } else {
                  return const Center(child: LinearProgressIndicator());
                }
              })),
    );
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
