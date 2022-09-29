import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilesoft_flutter_test/models/employee.dart';
import 'package:mobilesoft_flutter_test/screens/employee_profile_card.dart';

class EmployeeListCard extends StatelessWidget {
  EmployeeListCard({Key? key, required this.emp}) : super(key: key);
  Employee emp;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => EmployeeProfileCard(employee: emp));
      },
      child: Column(children: [
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
                    child: SizedBox(
                  width: 150,
                  height: 150,
                  child: emp.photoUrl != null
                      ? Image.network(
                          "http://testapp.mobilesoft.cz${emp.photoUrl}")
                      : const Icon(
                          Icons.person_outline_rounded,
                          size: 150,
                        ),
                )),
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
                        style: const TextStyle(
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
                            style: const TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
