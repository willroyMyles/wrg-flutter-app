import 'package:flutter/material.dart';
import 'package:wrg2/backend/enums/enum.post.dart';

extension StatusExtension on Status {
  String toCommonString() {
    var str = this.toString();
    str = str.replaceRange(0, 7, '');
    str = str.replaceFirst("_", " ");
    return str.toLowerCase();
  }

  MaterialColor color() {
    if (this == Status.SEEKING) return Colors.red;
    if (this == Status.IN_PROGRESS) return Colors.amber;
    if (this == Status.COMPLETED) return Colors.green;
    if (this == Status.EXPIRED) return Colors.grey;
  }
}
