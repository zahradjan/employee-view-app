class Employee {
  int id;
  String name;
  String department;
  int salary;
  String photoUrl;
  Employee(this.id, this.name, this.department, this.salary, this.photoUrl) {}

  toJson() => {
        'id': id,
        'name': name,
        'department': department,
        'salary': salary,
        'photoUrl': photoUrl,
      };
}
