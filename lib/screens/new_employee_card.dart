import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobilesoft_flutter_test/controllers/employees_controller.dart';
import 'package:mobilesoft_flutter_test/screens/components/employee_img_picker.dart';

class NewEmployeeCard extends StatefulWidget {
  const NewEmployeeCard({Key? key}) : super(key: key);

  @override
  State<NewEmployeeCard> createState() => _NewEmployeeCardState();
}

class _NewEmployeeCardState extends State<NewEmployeeCard> {
  String name = '';
  String department = '';
  int salary = 0;
  EmployeesController employeesController = Get.put(EmployeesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text("New Employee")),
      body: Column(children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EmployeeImagePicker(),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                          onChanged: (value) =>
                              {employeesController.setEmpName = value},
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Address',
                            ),
                            onChanged: (value) =>
                                {employeesController.setEmpAddress = value},
                            minLines: 1,
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Department',
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    onChanged: (value) =>
                        {employeesController.setEmpDepartment = value}),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Salary',
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    onChanged: (value) =>
                        {employeesController.setEmpSalary = int.parse(value)}),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    employeesController.createNewEmployee();
                  },
                  minWidth: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Text("CREATE"),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
