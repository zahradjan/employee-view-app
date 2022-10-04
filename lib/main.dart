import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilesoft_flutter_test/screens/employees_view_screen.dart';
import 'package:mobilesoft_flutter_test/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Employee View',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      home: const EmployeesViewScreen(),
    );
  }
}
