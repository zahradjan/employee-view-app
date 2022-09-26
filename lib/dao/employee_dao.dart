import 'package:floor/floor.dart';
import 'package:mobilesoft_flutter_test/models/employee.dart';

@dao
abstract class EmployeeDao {
  @Query('SELECT * FROM Employee')
  Stream<List<Employee>> getAllEmployees();

  @Query('SELECT * FROM Employee WHERE id=:id')
  Stream<Employee?> getEmployeeById(int id);

//TODO: If photoUrl exists
  @Query('SELECT photoUrl FROM Employee WHERE id=:id ')
  Stream<Employee?> getPhotoOfEmployee(int id);

  @insert
  Future<void> addNewEmployee(Employee employee);
}