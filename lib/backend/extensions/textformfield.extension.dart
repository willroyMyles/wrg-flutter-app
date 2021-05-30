import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/text.extension.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'color.extension.dart';

extension TFF on TextFormField {
  input({String label = ""}) {
    ServiceTheme ts = Get.find<ServiceTheme>();
    var bc = ts.bg.value.darker();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Texxt(label).hint(),
          ),
          TextFormField(
            validator: this.validator,
            controller: this.controller,
            decoration: InputDecoration(
                fillColor: ts.bg.value.lighter().withOpacity(.4),
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: bc,
                  width: 1.6,
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: bc,
                  width: 1.6,
                )),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: bc.withOpacity(.1),
                  width: 1,
                ))),
          ),
        ],
      ),
    );
  }
}
