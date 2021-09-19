import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/text.extension.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'color.extension.dart';

extension TFF on TextFormField {
  Widget input({String label = ""}) {
    ServiceTheme ts = Get.find<ServiceTheme>();
    var bc = ts.bg.value.darker();
    var lineHeight = 2.0;

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
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
                fillColor: ts.bg.value.lighter().withOpacity(.4),
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
          Container(
            height: 1,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.3))
                ],
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.green.shade100, Colors.green.shade800],
                    stops: [Random().nextDouble(), Random().nextDouble()])),
          )
        ],
      ),
    );
  }
}
