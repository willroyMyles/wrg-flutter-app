import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/text.extension.dart';
import 'package:wrg2/backend/services/service.theme.dart';

extension WD on Widget {
  gradient() {
    ServiceTheme ts = Get.find<ServiceTheme>();

    return Container(
      decoration: BoxDecoration(gradient: ts.gradient),
      child: this,
    );
  }

  background() {
    ServiceTheme ts = Get.find<ServiceTheme>();

    return Container(
      decoration: BoxDecoration(
          // color: ts.bg.value
          ),
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

  Widget glass() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: ts.white.withOpacity(1)),
          // gradient: ts.fin,
          borderRadius: BorderRadius.circular(100),
          // boxShadow: [BoxShadow(color: ts.blue.withOpacity(.4))],
          color: ts.grey1.withOpacity(0)),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: this,
      ),
    );
  }
}
