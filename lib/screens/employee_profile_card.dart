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
        body: Column(children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 300,
                          child: widget.employee.photoUrl != null
                              ? Image.network(
                                  "http://testapp.mobilesoft.cz${widget.employee.photoUrl}",
                                  loadingBuilder: (context, child,
                                          loadingProgress) =>
                                      (loadingProgress == null)
                                          ? child
                                          : Center(
                                              heightFactor: 30,
                                              widthFactor: 30,
                                              child:
                                                  CircularProgressIndicator()),
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 300,
                                  ),
                                )
                              : const Icon(
                                  Icons.person_outline_rounded,
                                  size: 300,
                                ))),
                ),
              ]),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 8, top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Department",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20)),
                  widget.employee.department != null
                      ? Text(widget.employee.department!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20))
                      : Container(),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Salary",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20)),
                widget.employee.salary != null
                    ? Text(widget.employee.salary.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20))
                    : Container(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Address",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20)),
                widget.employee.address != null
                    ? Text(widget.employee.address!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20))
                    : Container(),
              ],
            ),
          ),
        ]));
  }
}
