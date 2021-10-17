import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/create/view.create.dart';
import 'package:wrg2/fontend/pages/profile/view.profile.dart';
import 'package:wrg2/fontend/pages/state.homepage.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class HomePageView extends StatelessWidget {
  final controller = Get.put(HomePageState());
  final ts = Get.find<ServiceTheme>();
  final infoService = Get.find<InformationService>();
  final service = Get.find<APIService>();
  final double padding = 20.0;
  final col = Colors.green;
  @override
  Widget build(BuildContext context) {
    infoService.updateFab(true);

    return Stack(
      children: [
        Scaffold(
          key: controller.scaffoldKey,
          drawer: Drawer(
            child: ProfileView(),
            elevation: 0,
          ),
          body: PageView(
            onPageChanged: (value) {
              controller.updateTabs(value);
            },
            controller: controller.pc,
            // physics: AlwaysScrollableScrollPhysics(),
            children: [...controller.views],
          ),
        ),
        Positioned(
          bottom: 40,
          // right: 20,
          child: Builder(builder: (context) {
            return Container(
              height: 70,
              width: Get.width,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "fab",
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      // padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: ts.grey1,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: -5,
                                blurRadius: 10,
                                color: ts.red.withOpacity(.3),
                                offset: Offset(0, 4)),
                            BoxShadow(
                                blurRadius: 10,
                                color: ts.grey1.withOpacity(.3),
                                offset: Offset(0, 4))
                          ]),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildTab(CupertinoIcons.house, 0),
                            buildTab(CupertinoIcons.tray_full, 1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).fadeInUp(multiplier: 2);
          }),
        )
      ],
    );
  }

  Widget buildTab(IconData data, int i) {
    return GetBuilder<HomePageState>(
      init: controller,
      builder: (controller) {
        var selected = i == controller.currentIndex.value;
        return GestureDetector(
          onTap: () {
            controller.onIndexTapped(i);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 350),
            width: selected ? 50 : 50,
            height: selected ? 50 : 50,
            margin:
                EdgeInsets.only(left: i == 0 ? 10 : 5, right: i == 1 ? 10 : 5),
            // padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Icon(
              data,
              size: 33,

              color: selected ? ts.red : ts.white.withOpacity(.5),
              // color: ts.fg.value,
            ),
          ),
        );
      },
    );
  }
}
