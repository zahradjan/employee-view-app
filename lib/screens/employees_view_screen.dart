import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmployeesViewScreen extends StatefulWidget {
  const EmployeesViewScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<EmployeesViewScreen> createState() => _EmployeesViewScreenState();
}

class _EmployeesViewScreenState extends State<EmployeesViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
