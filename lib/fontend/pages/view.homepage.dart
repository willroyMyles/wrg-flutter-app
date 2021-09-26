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

          // appBar: AppBar(
          //   // title: Text("WRG Auto"),
          //   elevation: 0,
          //   toolbarHeight: 50,
          //   bottom: PreferredSize(
          //     preferredSize: Size(Get.width, 80),
          //     child: Container(
          //       width: Get.width,
          //       height: 50,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Spacer(),
          //           Spacer(),
          //           TabBar(
          //             isScrollable: true,
          //             controller: controller.tabController,
          //             onTap: (value) {
          //               controller.onIndexTapped(value);
          //             },
          //             tabs: [
          //               Tab(
          //                 text: "Personal",
          //                 // icon: Icon(Icons.gps_fixed_rounded),
          //               ),
          //               Tab(
          //                 text: "Discover",
          //                 // icon: Icon(Icons.all_inbox_sharp),
          //               ),
          //               // Tab(
          //               //   text: "Account",
          //               //   // icon: Icon(Icons.disc_full),
          //               // ),
          //             ],
          //           ),
          //           Spacer(),
          //           InkWell(
          //             onTap: () {
          //               controller.scaffoldKey.currentState.openDrawer();
          //             },
          //             child: Obx(
          //               () {
          //                 var val = infoService.isSignedIn.value;
          //                 return AnimatedContainer(
          //                   duration: Duration(milliseconds: 550),
          //                   padding: EdgeInsets.all(5),
          //                   margin: EdgeInsets.only(right: 10),
          //                   clipBehavior: Clip.antiAlias,
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(100),
          //                       boxShadow: [
          //                         BoxShadow(
          //                           blurRadius: val ? 5 : 0,
          //                           color: val
          //                               ? Colors.black.withOpacity(.1)
          //                               : Colors.transparent,
          //                         )
          //                       ]),
          //                   child: infoService.isSignedIn.value
          //                       ? CircleAvatar(
          //                           backgroundImage: Image.network(
          //                                   service.userInfo.value.userImageUrl)
          //                               .image,
          //                           maxRadius: 12,
          //                         )
          //                       : Icon(CupertinoIcons.person_alt_circle),
          //                 );
          //               },
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
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
          bottom: 30,
          // right: 20,
          child: GestureDetector(
            onTap: () {
              Get.to(() => CreatePost());
            },
            child: Builder(builder: (context) {
              var width = 50.0;
              var height = 50.0;
              return Container(
                height: height,
                width: Get.width,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        // color: ts.grey1,
                        borderRadius: BorderRadius.circular(50),
                        // boxShadow: [
                        //   BoxShadow(
                        //       blurRadius: 0,
                        //       color: Colors.green,
                        //       offset: Offset(4, 6))
                        // ]
                      ),
                      child: Row(
                        children: [
                          buildTab(CupertinoIcons.house, 0),
                          buildTab(CupertinoIcons.tray_full, 1),
                          // buildTab(CupertinoIcons.add_circled, 2),
                        ],
                      ).glass(),
                    ),
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  Widget buildTab(IconData data, int i) {
    return GetBuilder<HomePageState>(
      init: controller,
      builder: (controller) {
        var selected = i == controller.currentIndex.value;
        return Material(
          child: InkWell(
            onTap: () {
              controller.onIndexTapped(i);
            },
            child: Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Icon(
                data,
                size: 33,
                color: selected ? ts.blue : ts.grey.withOpacity(.5),
                // color: ts.fg.value,
              ),
            ),
          ),
        );
      },
    );
  }
}
