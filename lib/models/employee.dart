import 'package:floor/floor.dart';

@entity
class Employee {
  @primaryKey
  int? id;
  String? name;
  String? address;
  String? department;
  int? salary;
  String? photoUrl;
  Employee(
      {this.id,
      this.name,
      this.address,
      this.department,
      this.salary,
      this.photoUrl});

  toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'department': department,
        'salary': salary,
        'photoUrl': photoUrl,
      };

  factory Employee.fromJson(Map<String, dynamic> json) {
    final emp = Employee(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        department: json['department'],
        salary: json['salary'],
        photoUrl: json['photoUrl']);
    return emp;
  }
}
