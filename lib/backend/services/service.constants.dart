import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class Constants {
  static final duration = Duration(milliseconds: 350);
  static final durationShort = Duration(milliseconds: 150);
  static final durationLong = Duration(milliseconds: 650);
  static final br = 6.5;
  static final from = 50.0;
  static empty({String msg}) => empty(msg: msg);
  static final decoration = BoxDecoration(
      color: ts.white,
      borderRadius: BorderRadius.circular(Constants.br),
      border: Border.all(width: 1, color: ts.grey.withOpacity(.2)),
      boxShadow: [BoxShadow(blurRadius: 10, color: ts.grey.withOpacity(.1))]);
}

Widget empty({String msg = "No items"}) {
  var ts = Get.find<ServiceTheme>();
  return Container(
    height: 199,
    width: 199,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ts.grey1.withOpacity(.5),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                        blurRadius: 3,
                        color: ts.grey1.withOpacity(.3),
                        offset: Offset(.3, .3))
                  ]),
            ),
          ),
        ).fadeInUp(),
        Align(
          alignment: Alignment.center,
          child: FadeIn(
            delay: Duration(milliseconds: 1250),
            duration: Duration(milliseconds: 1000),
            child: Container(
              height: Get.width / 2,
              width: Get.width / 2,
              decoration: BoxDecoration(
                  color: ts.grey.withOpacity(.01),
                  borderRadius: BorderRadius.circular(300),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: ts.grey1.withOpacity(.05),
                    )
                  ]),
            ),
          ),
        )
      ],
    ),
  );
}

Widget emptySvg({withText = true}) => Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30),
      child: Container(
        height: Get.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/no-data1.svg",
              height: 300,
              color: Colors.green.withOpacity(.4),
              colorBlendMode: BlendMode.srcATop,
              clipBehavior: Clip.antiAlias,
            ),
            SizedBox(
              height: 10,
            ),
            if (withText)
              Text(
                "empty".toUpperCase(),
                textScaleFactor: 3,
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w900,
                    color: Colors.black.withOpacity(.8)),
              ),
            Text("tap to retry")
          ],
        ),
      ),
    );

Widget loadingSvg({withText = true}) => Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30),
      child: Container(
        height: Get.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/loading.svg",
              height: 200,
              color: Colors.green.withOpacity(.4),
              colorBlendMode: BlendMode.srcATop,
              clipBehavior: Clip.antiAlias,
            ),
            SizedBox(
              height: 10,
            ),
            if (withText)
              Text(
                "Loading".toUpperCase(),
                textScaleFactor: 3,
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w900,
                    color: Colors.black.withOpacity(.8)),
              ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 7,
              clipBehavior: Clip.antiAlias,
              width: Get.width / 2,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(
                  Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
