import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.theme.dart';

class Constants {
  static final duration = Duration(milliseconds: 350);
  static final durationShort = Duration(milliseconds: 150);
  static final durationLong = Duration(milliseconds: 650);
  static final br = 6.5;
  static final from = 50.0;
}

var ts = Get.find<ServiceTheme>();

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
