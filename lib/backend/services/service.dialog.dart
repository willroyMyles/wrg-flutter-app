import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogService {
  showDialog(Widget widget) {
    Get.dialog(
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Material(
            child: SizedBox(
              child: Container(
                height: Get.height / 3,
                width: Get.width,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 50),
                child: widget,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          color: Colors.black.withOpacity(.1),
                          offset: Offset(3, 5))
                    ],
                    color: Colors.white),
              ),
            ),
          ),
        ),
        barrierColor: Colors.black.withOpacity(.2),
        barrierDismissible: true,
        useRootNavigator: true);
  }

  closeDialog() {
    if (Get.isDialogOpen) {
      Get.close(1);
      FocusScope.of(Get.context).unfocus();
    }
  }
}
