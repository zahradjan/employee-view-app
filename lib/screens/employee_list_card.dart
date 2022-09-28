import 'package:flutter/material.dart';
import 'package:mobilesoft_flutter_test/models/employee.dart';

class EmployeeListCard extends StatelessWidget {
  EmployeeListCard({Key? key, required this.emp}) : super(key: key);
  Employee emp;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        // margin: const EdgeInsets.only(left: 20, right: 20),
        // margin: const EdgeInsets.only(bottom: 5, top: 5),
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                child: emp.photoUrl != null
                    ? Container(
                        width: 150,
                        height: 150,
                        child: Image.network(
                            "http://testapp.mobilesoft.cz${emp.photoUrl}"))
                    : Icon(
                        Icons.person_outline_rounded,
                        size: 150,
                      ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      emp.name!,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Opacity(
                      opacity: 0.64,
                      child: Text(emp.department ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
