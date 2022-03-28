import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/text.extension.dart';
import 'package:wrg2/backend/services/service.preferences.dart';
import 'package:wrg2/fontend/pages/intro/state.infoScreen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key key}) : super(key: key);

  final controller = Get.put(InfoScreenState());

  var titles = [
    "Post what your looking for",
    "Have the dealers source your parts",
    "And just relax"
  ];

  var btnText = ["NEXT", "ALMOST THERE", "LET'S GO!"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<InfoScreenState>(
        builder: (controller) => Stack(
          children: [
            Positioned(
                top: Get.height / 16,
                child: Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    "WRG",
                    style: TextStyle(
                        color: ts.grey1.withOpacity(.7),
                        fontSize: 180,
                        fontWeight: FontWeight.w700),
                  ),
                )),
            PageView.builder(
              physics: ClampingScrollPhysics(),
              controller: controller.controller,
              onPageChanged: (value) {
                controller.updateIndex(value);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return buildPage(index);
              },
            ),
            Positioned(
                bottom: 30,
                child: Container(
                  width: Get.width,
                  height: 60,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: GestureDetector(
                    onTap: () {
                      controller.updatePage(controller.idx + 1);
                    },
                    child: Container(
                        height: 50,
                        width: Get.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ts.grey1,
                            borderRadius: BorderRadius.circular(7)),
                        child: Text(
                          btnText[controller.idx],
                          style: TextStyle(
                              color: ts.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildPage(int index) {
    return Stack(
      children: [
        Container(
          // color: ts.white,
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 10, vertical: Get.height / 6),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: ts.grey1,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Colors.black.withOpacity(.6),
                      offset: Offset(0, 0)),
                  // BoxShadow(
                  //     blurRadius: 10,
                  //     color: ts.red.withOpacity(.4),
                  //     offset: Offset(-5, -5)),
                ]),
            child: Column(
              children: [
                Text(
                  titles.elementAt(index),
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 32),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Image.asset(controller.imgs.elementAt(index)))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
