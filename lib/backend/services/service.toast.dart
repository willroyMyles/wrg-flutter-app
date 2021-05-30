import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class ToastService {
  FToast ft;
  String msg;
  MaterialColor color;

  ToastService(BuildContext context) {
    ft = FToast();
    ft.init(context);
  }

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
