import 'dart:async';

import 'package:floor/floor.dart';
import 'package:mobilesoft_flutter_test/dao/employee_dao.dart';
import 'package:mobilesoft_flutter_test/models/employee.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Employee])
abstract class AppDatabase extends FloorDatabase {
  EmployeeDao get employeeDao;
}
