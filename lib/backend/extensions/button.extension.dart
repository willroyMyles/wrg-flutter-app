import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/text.extension.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import './color.extension.dart';

extension BTN on FlatButton {
  Widget btn() {
    ServiceTheme ts = Get.find<ServiceTheme>();
    var child = this.child as Text;

    return RaisedButton(
        onPressed: this.onPressed,
        child: Text(
          child.data,
          style: TextStyle(color: ts.red),
        ),
        color: Colors.transparent,
        elevation: 0,
        splashColor: Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: BorderSide(color: ts.red, width: 1.5)));
  }

  Widget btn2() {
    var child = this.child as Text;

    return RaisedButton(
        onPressed: this.onPressed,
        child: Text(
          child.data,
          style: TextStyle(color: ts.white),
        ),
        color: Colors.transparent,
        elevation: 0,
        splashColor: Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: BorderSide(color: ts.white, width: 1)));
  }

  Widget primary() {
    ServiceTheme ts = Get.find<ServiceTheme>();
    return RaisedButton(
        onPressed: this.onPressed,
        child: this.child,
        // textColor: ts.fgbtnt.value,
        // color: ts.fgbtn.value,
        elevation: 5,
        // splashColor: ts.pc,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
          // side: BorderSide(color: ts.pc, width: 10)
        ));
  }

  Widget secondary() {
    ServiceTheme ts = Get.find<ServiceTheme>();
    return RaisedButton(
        onPressed: this.onPressed,
        child: this.child,
        // textColor: ts.fgt.value,
        color: Colors.transparent,
        elevation: 0,
        // splashColor: ts.pc,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: BorderSide(width: 1.5)));
  }
}
