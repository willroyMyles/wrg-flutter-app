import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/text.extension.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/BottomLine.dart';
import 'color.extension.dart';

extension TFF on TextFormField {
  Widget input({String label = "", int minLines = 1}) {
    ServiceTheme ts = Get.find<ServiceTheme>();
    var bc = Colors.grey;
    var lineHeight = 0.0;
    var tff = this;

    InputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(Constants.br),
        borderSide: BorderSide(color: ts.white));

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3, bottom: 05),
            child: Text(
              label,
              textScaleFactor: .9,
              style: TextStyle(color: ts.grey),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    color: ts.grey.withOpacity(.1),
                    offset: Offset(0, 10))
              ],
            ),
            child: TextFormField(
              validator: this.validator,
              controller: this.controller,
              minLines: minLines,
              maxLines: minLines,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  fillColor: ts.white,
                  filled: true,
                  // labelText: this.labelText,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: bc,
                    width: lineHeight,
                  )),
                  enabledBorder: border,
                  border: border),
            ),
          ),
          // BottomLine()
        ],
      ),
    );
  }
}
