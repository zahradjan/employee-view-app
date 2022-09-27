import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilesoft_flutter_test/dao/employee_dao.dart';
import 'package:mobilesoft_flutter_test/db/database.dart';
import 'package:mobilesoft_flutter_test/screens/employees_view_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder("employee_database.db").build();
  final dao = database.employeeDao;
  runApp(MyApp(dao: dao));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.dao}) : super(key: key);
  final EmployeeDao dao;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Employee View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmployeesViewScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
