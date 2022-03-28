import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/helper%20widgets/Gaussian.dart';
import 'package:wrg2/fontend/pages/create/view.create.dart';
import 'package:wrg2/fontend/pages/discover/view.discover.dart';
import 'package:wrg2/fontend/pages/discover/view.discover.toolbar.dart';
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

  @override
  Widget build(BuildContext context) {
    infoService.updateFab(true);

    return Stack(
      children: [
        Scaffold(
            floatingActionButton: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Guassian(
                    child: Container(
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                            children: [Icon(Icons.add), Text("create post")]),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Constants.br),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GetBuilder<HomePageState>(
                    builder: (controller) {
                      return AnimatedOpacity(
                        duration: Duration(milliseconds: 150),
                        opacity: controller.showArrow ? 1 : .0,
                        child: InkWell(
                          onTap: () {
                            controller.animateToTop();
                          },
                          child: AnimatedContainer(
                            height: controller.showArrow ? 30 : 0,
                            width: controller.showArrow ? 30 : 0,
                            duration: Duration(milliseconds: 150),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 0),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1)),
                            child: Container(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                                size: 20,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            drawer: Drawer(
              child: ProfileView(),
              elevation: 0,
            ),
            body: NestedScrollView(
              controller: controller.scrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
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
                  // DiscoverToolBar(),
                ];
              },
              body: Discover(),
            )),
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
