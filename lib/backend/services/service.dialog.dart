import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogService {
  Future<bool> showDialog(Widget widget) async {
    await Get.dialog(
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Material(
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // height: Get.height / 3,
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
                ],
              ),
            ),
          ),
        ),
        barrierColor: Colors.black.withOpacity(.4),
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 550),
        useRootNavigator: true);

    return Future.value(true);
  }

  closeDialog() {
    if (Get.isDialogOpen) {
      Get.close(1);
      FocusScope.of(Get.context).unfocus();
    }
  }
}
