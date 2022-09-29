import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobilesoft_flutter_test/models/employee.dart';

class EmployeeProfileCard extends StatefulWidget {
  const EmployeeProfileCard({Key? key, required this.employee})
      : super(key: key);
  final Employee employee;
  @override
  State<EmployeeProfileCard> createState() => _EmployeeProfileCardState();
}

class _EmployeeProfileCardState extends State<EmployeeProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(widget.employee.name!),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              height: 300,
                              child: widget.employee.photoUrl != null
                                  ? Image.network(
                                      "http://testapp.mobilesoft.cz${widget.employee.photoUrl}")
                                  : Icon(
                                      Icons.person_outline_rounded,
                                      size: 300,
                                    ))),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Department",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20)),
                      widget.employee.department != null
                          ? Text(widget.employee.department!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 20))
                          : Container(),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Salary",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20)),
                    widget.employee.salary != null
                        ? Text(widget.employee.salary.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 20))
                        : Container(),
                  ],
                ),
              ),
            ]));
  }
}
