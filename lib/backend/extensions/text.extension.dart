import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import './color.extension.dart';
import 'package:timeago/timeago.dart' as timeago;

var ts = Get.find<ServiceTheme>();

extension TextModifier on Text {
  Widget h1() {
    return Text(
      this.data,
      textScaleFactor: this.textScaleFactor ?? 1,
      // overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(fontWeight: FontWeight.w700,
          // color: ts.fgt.value.withOpacity(1).withGreen(60),
          shadows: [
            Shadow(
                blurRadius: 5,
                color: Colors.grey.withOpacity(.1),
                offset: Offset(2, 5)),
          ]),
    );
  }

  Widget h2() {
    return Text(
      this.data,
      textScaleFactor: .9,
      overflow: TextOverflow.fade,
      maxLines: 3,
      style: TextStyle(fontWeight: FontWeight.w500),
    );
  }

  Widget h3() {
    return Text(
      this.data,
      textScaleFactor: .8,
      style: TextStyle(fontWeight: FontWeight.w500),
    );
  }

  Widget h4() {
    return Text(
      this.data,
      textScaleFactor: .8,
      style: TextStyle(
          fontWeight: FontWeight.w400, color: ts.grey.withOpacity(.8)),
    );
  }

  Widget hint() {
    return Text(
      this.data,
      textScaleFactor: .8,
      style: TextStyle(fontWeight: FontWeight.w800),
    );
  }

  Text hdate(DateTime t) {
    var tago = timeago.format(t);
    return Text(
      tago,
      textScaleFactor: .8,
      maxLines: 3,
      overflow: TextOverflow.fade,
      softWrap: true,
      textAlign: TextAlign.end,
      style: TextStyle(fontWeight: FontWeight.w500, color: ts.grey),
    );
  }

  Widget hunch() {
    return Text(
      this.data,
      textScaleFactor: .9,
      style: TextStyle(fontWeight: FontWeight.w700),
    );
  }

  Widget huge() {
    return Text(
      this.data,
      textScaleFactor:
          this.textScaleFactor == null ? 2.0 : this.textScaleFactor,
      style: TextStyle(fontWeight: FontWeight.w700),
    );
  }

  Widget humungous() {
    return Text(this.data,
        textScaleFactor:
            this.textScaleFactor == null ? 5 : this.textScaleFactor,
        style: TextStyle(fontWeight: FontWeight.w700,
            // color: ts.fgt.value.withOpacity(.5),
            shadows: [
              Shadow(
                  blurRadius: 8,
                  color: Colors.grey.withOpacity(.5),
                  offset: Offset(2, 5)),
            ]));
  }

  Widget humungousThin() {
    return Text(this.data,
        textScaleFactor:
            this.textScaleFactor == null ? 5 : this.textScaleFactor,
        style: TextStyle(fontWeight: FontWeight.w300,
            // color: ts.fgt.value.withOpacity(.5),
            shadows: [
              Shadow(
                  blurRadius: 8,
                  color: Colors.grey.withOpacity(.5),
                  offset: Offset(2, 5)),
            ]));
  }
}
