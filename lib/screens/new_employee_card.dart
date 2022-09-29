import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewEmployeeCard extends StatefulWidget {
  const NewEmployeeCard({Key? key}) : super(key: key);

  @override
  State<NewEmployeeCard> createState() => _NewEmployeeCardState();
}

class _NewEmployeeCardState extends State<NewEmployeeCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, title: const Text("New Employee")),
    );
  }
}
