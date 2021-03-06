import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/create/view.create.dart';
import 'package:wrg2/fontend/pages/discover/view.discover.dart';
import 'package:wrg2/fontend/pages/discover/view.discoverSliver.dart';
import 'package:wrg2/fontend/pages/offers/view.offers.dart';
import 'package:wrg2/fontend/pages/personal/view.personal.dart';
import 'package:wrg2/fontend/pages/profile/view.profile.dart';
import 'package:wrg2/fontend/pages/state.homepage.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/fontend/pages/watching/section/view.watchingSection.dart';

class HomePageView extends StatelessWidget {
  final controller = Get.put(HomePageState());

  final ts = Get.find<ServiceTheme>();
  final infoService = Get.find<InformationService>();
  final service = Get.find<APIService>();
  final double padding = 20.0;
  final col = Colors.green;

  final scrollCOntroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    infoService.updateFab(true);

    return Stack(
      children: [
        Scaffold(
            key: controller.scaffoldKey,
            // extendBody: true,
            // bottomNavigationBar: Container(
            //   height: 80,
            //   width: Get.width,
            //   color: Colors.transparent,
            //   alignment: Alignment.topCenter,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Hero(
            //         tag: "fab",
            //         child: Container(
            //           clipBehavior: Clip.antiAlias,
            //           height: 60,
            //           width: Get.width / 2,
            //           // padding: EdgeInsets.symmetric(horizontal: 10),
            //           decoration: BoxDecoration(
            //               color: ts.grey1,
            //               borderRadius: BorderRadius.circular(10),
            //               boxShadow: [
            //                 BoxShadow(
            //                     spreadRadius: -5,
            //                     blurRadius: 10,
            //                     color: ts.red.withOpacity(.3),
            //                     offset: Offset(0, 4)),
            //                 BoxShadow(
            //                     blurRadius: 10,
            //                     color: ts.grey1.withOpacity(.3),
            //                     offset: Offset(0, 4))
            //               ]),
            //           child: Container(
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 buildTab(CupertinoIcons.house, 0),
            //                 buildTab(CupertinoIcons.tray_full, 1),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ).fadeInUp(multiplier: 2),
            drawer: Drawer(
              child: ProfileView(),
              elevation: 0,
            ),
            body: CustomScrollView(controller: scrollCOntroller,
                // headerSliverBuilder: (context, innerBoxIsScrolled) {
                slivers: [
                  SliverSafeArea(
                    sliver: SliverAppBar(
                      primary: false,
                      automaticallyImplyLeading: false,
                      toolbarHeight: 0,
                      backgroundColor: Colors.transparent,
                      bottom: PreferredSize(
                        preferredSize: Size(Get.width, 90),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.center,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Personal()]),
                        ),
                      ),
                      // title: Container(
                      //   child: Personal(),
                      // ),
                    ),
                  ),
                  SliverAppBar(
                    primary: false,
                    automaticallyImplyLeading: false,
                    toolbarHeight: 0,
                    backgroundColor: Colors.transparent,
                    bottom: PreferredSize(
                      preferredSize: Size(Get.width, 150),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20),
                        alignment: Alignment.center,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              OfferView(),
                              WatchingSection(),
                            ]),
                      ),
                    ),
                    // title: Container(
                    //   child: Personal(),
                    // ),
                  ),
                  DiscoverSliver()
                ])

            // body: PageView(
            //   onPageChanged: (value) {
            //     controller.updateTabs(value);
            //   },
            //   controller: controller.pc,
            //   // physics: AlwaysScrollableScrollPhysics(),
            //   children: [...controller.views],
            // ),
            ),
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
            duration: Duration(milliseconds: 1650),
            width: selected ? 70 : 70,
            height: selected ? 70 : 70,
            // margin:
            //     EdgeInsets.only(left: i == 0 ? 10 : 5, right: i == 1 ? 10 : 5),
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
