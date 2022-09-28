import 'package:floor/floor.dart';

@entity
class Employee {
  @primaryKey
  int? id;
  String? name;
  String? department;
  int? salary;
  String? photoUrl;
  Employee({this.id, this.name, this.department, this.salary, this.photoUrl});

  toJson() => {
        'id': id,
        'name': name,
        'department': department,
        'salary': salary,
        'photoUrl': photoUrl,
      };

  factory Employee.fromJson(Map<String, dynamic> json) {
    final emp = Employee(
        id: json['id'],
        name: json['name'],
        department: json['department'],
        salary: json['salary'],
        photoUrl: json['photoUrl']);
    return emp;
  }
}
