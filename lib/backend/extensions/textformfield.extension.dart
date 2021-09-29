import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/text.extension.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/BottomLine.dart';
import 'color.extension.dart';

extension TFF on TextFormField {
  Widget input({String label = "", int minLines = 1}) {
    ServiceTheme ts = Get.find<ServiceTheme>();
    var bc = Colors.grey;
    var lineHeight = 2.0;
    var tff = this;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3, bottom: 7),
            child: Text(label).hint(),
          ),
          TextFormField(
            validator: this.validator,
            controller: this.controller,
            minLines: minLines,
            maxLines: minLines,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
                // fillColor: ts.bg.value.lighter().withOpacity(.4),
                filled: true,
                // labelText: this.labelText,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: bc,
                  width: lineHeight,
                )),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: bc,
                  width: lineHeight,
                )),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: bc.withOpacity(.1),
                  width: lineHeight,
                ))),
          ),
          BottomLine()
        ],
      ),
    );
  }
}
