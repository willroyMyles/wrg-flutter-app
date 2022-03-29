import 'package:flutter/material.dart';
import 'package:wrg2/backend/extensions/ext.dart';

enum Status { OPEN, PROCESSING, COMPLETED, EXPIRED, CANCELED }

extension StatusHelper on Status {
  static Color openColor = Colors.green;
  static Color allColor = Colors.white;
  static Color processingColor = Colors.blue;
  static Color completedColor = Colors.purple;
  static Color expiredColor = Colors.red;
  static Color cancelledColor = Colors.orange;

  Color getColor() {
    // if (this == Status.ALL) return StatusHelper.allColor;
    if (this == Status.OPEN) return StatusHelper.openColor;
    if (this == Status.PROCESSING) return StatusHelper.processingColor;
    if (this == Status.COMPLETED) return StatusHelper.completedColor;
    if (this == Status.EXPIRED) return StatusHelper.expiredColor;
    if (this == Status.CANCELED) return StatusHelper.cancelledColor;
  }

  Widget get textName => Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        alignment: Alignment.centerRight,
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: this.getColor().lighter().withOpacity(.5),
          borderRadius: BorderRadius.circular(30),
          // boxShadow: [
          //   BoxShadow(color: this.getColor().darker(), blurRadius: 5)
          // ]
          //   border: Border(
          // right: BorderSide(
          //   color: this.getColor(),
          //   width: 6,
          // ),
          // left: BorderSide(color: this.getColor(), width: 0),
          // top: BorderSide(color: this.getColor(), width: 0),
          // bottom: BorderSide(color: this.getColor(), width: 0),
        ),
        // child: Text(this.name,
        //     style: TextStyle(
        //       color: this.getColor(),
        //       fontWeight: FontWeight.w700,
        //       fontSize: 20,
        //     )),
      );

  String get name => this.toString().toLowerCase().replaceAll("status.", "");
}
