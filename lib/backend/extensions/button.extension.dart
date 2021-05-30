import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import './color.extension.dart';

extension BTN on FlatButton {
  Widget btn() {
    ServiceTheme ts = Get.find<ServiceTheme>();
    return RaisedButton(
        onPressed: this.onPressed,
        child: this.child,
        color: ts.fg.value,
        elevation: 2,
        splashColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
          // side: BorderSide(color: ts.pc, width: 10)
        ));
  }

  primary() {
    ServiceTheme ts = Get.find<ServiceTheme>();
    return RaisedButton(
        onPressed: this.onPressed,
        child: this.child,
        textColor: ts.fgbtnt.value,
        color: ts.fgbtn.value,
        elevation: 2,
        splashColor: ts.pc,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
          // side: BorderSide(color: ts.pc, width: 10)
        ));
  }

  secondary() {
    ServiceTheme ts = Get.find<ServiceTheme>();
    return RaisedButton(
        onPressed: this.onPressed,
        child: this.child,
        textColor: ts.fgt.value,
        color: ts.bg.value.darker(),
        elevation: 0,
        splashColor: ts.pc,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side:
                BorderSide(color: ts.fgbtn.value.withOpacity(.9), width: 1.5)));
  }
}
