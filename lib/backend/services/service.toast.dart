import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ToastService extends GetxController {
  success(String str) {
    Fluttertoast.showToast(msg: str);
  }

  error(String str) {
    Fluttertoast.showToast(msg: str, backgroundColor: Colors.red.shade200);
  }
}
