import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
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

  Widget radialGradientMask(List<Color> colors) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: colors,
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: this,
    );
  }

  Widget linearGradientMask(List<Color> colors) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: this,
    );
  }

  Widget toasty(){
    return OKToast(child: this);
  }
}
