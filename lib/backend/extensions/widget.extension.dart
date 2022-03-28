import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/text.extension.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/helper%20widgets/touchUp.dart';

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

  Widget touchy() {
    return TouchUp(
      child: this,
    );
  }

  Widget glass() {
    return FadeInUp(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: ts.grey1.withOpacity(0)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 3,
            sigmaY: 3,
          ),
          child: this,
        ),
      ),
    );
  }
}
