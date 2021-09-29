import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class BottomLine extends StatelessWidget {
  const BottomLine({
    Key key,
    this.height = 2,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.3))
          ],
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // colors: [Colors.green.shade100, Colors.green.shade800],
              colors: [
                ts.lightTheme.primaryColor.lighter().lighter(),
                ts.lightTheme.primaryColor.darker().darker()
              ],
              stops: [
                Random().nextDouble(),
                Random().nextDouble()
              ])),
    );
  }
}
