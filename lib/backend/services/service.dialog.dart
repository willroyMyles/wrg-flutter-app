import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/fontend/components/BottomLine.dart';

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

  Future<bool> showInfo({String msg, String tag = ""}) async {
    closeDialog();
    return await Get.dialog(
      SimpleDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        backgroundColor: ts.grey1,
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        title: Container(color: ts.grey1, child: Text("Info")),
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            // height: 100,
            color: ts.grey1,
            child: Text(
              msg,
              maxLines: 4,
              overflow: TextOverflow.fade,
              textScaleFactor: 1,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    closeDialog();
                  },
                  child: Text("ok"),
                ).btn2()
              ],
            ),
          ),
          Container(
            height: 5,
          ).gradient(),
          BottomLine(
            height: 5,
          )
        ],
      ).elasticIn(),
      barrierColor: ts.grey.withOpacity(.2),
    );
  }

  Future<bool> showQuestion(
      {String msg,
      String tag = "",
      String yes,
      String no,
      String title}) async {
    closeDialog();
    return await Get.dialog(
      SimpleDialog(
        insetPadding: EdgeInsets.all(10),
        contentPadding: EdgeInsets.zero,
        backgroundColor: ts.grey1,
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        title:
            Container(color: ts.grey1, child: Text(title != null ? title : "")),
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            // height: 100,
            color: ts.grey1,
            child: Text(
              msg,
              maxLines: 4,
              overflow: TextOverflow.fade,
              textScaleFactor: 1,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    Get.back(result: false);
                    closeDialog();
                  },
                  child: Text(no != null ? no : "cancel"),
                ).btn2(),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  onPressed: () {
                    Get.back(result: true);

                    closeDialog();
                  },
                  child: Text(yes != null ? yes : "ok"),
                ).btn2(color: Colors.green),
              ].reversed.toList(),
            ),
          ),
          Container(
            height: 5,
          ).gradient(),
          BottomLine(
            height: 5,
          )
        ],
      ).elasticIn(),
      barrierColor: ts.grey.withOpacity(.2),
    );
  }

  closeDialog() {
    if (Get.isDialogOpen) {
      Get.close(1);
      FocusScope.of(Get.context).unfocus();
    }
  }
}
