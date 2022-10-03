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
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            // padding: const EdgeInsets.only(left: 20, right: 20),
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Theme.of(context).colorScheme.secondary,
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
                            "http://testapp.mobilesoft.cz${emp.photoUrl}",
                            loadingBuilder: (context, child, loadingProgress) =>
                                (loadingProgress == null)
                                    ? child
                                    : Center(
                                        heightFactor: 10,
                                        widthFactor: 10,
                                        child: CircularProgressIndicator()),
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 150,
                                ))
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
          ),
        )
      ]),
    );
  }
}
