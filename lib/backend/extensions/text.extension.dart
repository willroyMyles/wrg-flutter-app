import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.theme.dart';

class Texxt {
  String data;

  InlineSpan textSpan;

  TextStyle style;

  StrutStyle strutStyle;

  TextAlign textAlign;

  TextDirection textDirection;

  Locale locale;

  bool softWrap;

  TextOverflow overflow;

  double textScaleFactor;

  int maxLines;

  String semanticsLabel;

  TextWidthBasis textWidthBasis;

  Texxt(this.data,
      {Key key,
      this.style,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textSpan});

  var _ts = Get.find<ServiceTheme>();
}

extension TextModifier on Texxt {
  Widget h1() {
    this.style = TextStyle(
        fontWeight: FontWeight.w600,
        shadows: [BoxShadow(blurRadius: .5, color: Colors.grey)]);
    this.textScaleFactor = 1;
    return _getDefault();
  }

  Widget h2({bool withStr = true}) {
    this.style = TextStyle(fontWeight: FontWeight.w500);
    this.textScaleFactor = 1;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (withStr)
            Text(
              "content:",
              textScaleFactor: .8,
            ),
          SizedBox(
            height: 3,
          ),
          _getDefault()
        ],
      ),
    );
  }

  Widget h3() {
    this.style = TextStyle(
      fontWeight: FontWeight.w400,
      color: _ts.fgt.value.withOpacity(.85),
    );
    this.textScaleFactor = .9;
    return _getDefault();
  }

  Widget user() {
    this.style = TextStyle(
        fontWeight: FontWeight.w500,
        color: _ts.fgt.value.withOpacity(.3),
        shadows: [BoxShadow(blurRadius: .3, color: Colors.grey)]);
    this.textScaleFactor = 1;
    return _getDefault();
  }

  Widget huge() {
    this.style = TextStyle(
        fontWeight: FontWeight.w800,
        color: _ts.fgt.value.withOpacity(.9),
        shadows: [BoxShadow(blurRadius: .3, color: Colors.grey)]);
    this.textScaleFactor = 3;
    return _getDefault();
  }

  _getDefault() {
    return Text(
      this.data,
      style: this.style,
      strutStyle: this.strutStyle,
      textAlign: this.textAlign,
      textDirection: this.textDirection,
      locale: this.locale,
      softWrap: this.softWrap,
      overflow: this.overflow,
      textScaleFactor: this.textScaleFactor,
      maxLines: this.maxLines,
      semanticsLabel: this.semanticsLabel,
      textWidthBasis: this.textWidthBasis,
    );
  }
}
