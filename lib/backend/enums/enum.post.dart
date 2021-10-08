import 'package:flutter/material.dart';

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

  String get name => this.toString().toLowerCase().replaceAll("status.", "");
}
