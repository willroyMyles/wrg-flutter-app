import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class ToastService {
  String msg;
  MaterialColor color;

  success(
    String msg,
  ) {
    this.msg = msg;
    color = Colors.green;

    _show();
  }

  _show() {
    if (Get.isSnackbarOpen) {
      Get.close(1);
    }
    Get.showSnackbar(GetBar(
      backgroundColor: color.shade300,
      messageText: Texxt(msg).hint(),
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
      borderRadius: 5,
      barBlur: 5,
      margin: EdgeInsets.all(10),
    ));
  }
}
