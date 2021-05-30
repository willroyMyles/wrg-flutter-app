import 'package:flutter/material.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("personal view"),
      ),
    ).gradient();
  }
}
