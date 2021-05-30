import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.theme.dart';

extension WD on Widget {
  gradient() {
    ServiceTheme ts = Get.find<ServiceTheme>();

    return Container(
      decoration: BoxDecoration(gradient: ts.gradient.value),
      child: this,
    );
  }

  background() {
    ServiceTheme ts = Get.find<ServiceTheme>();

    return Container(
      decoration: BoxDecoration(color: ts.bg.value),
      child: this,
    );
  }
}
