import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.dialog.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/item.post.dart';
import 'package:wrg2/fontend/components/loading.dart';
import 'package:wrg2/fontend/pages/create/view.create.dart';
import 'package:wrg2/fontend/pages/discover/state.discover.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/fontend/pages/state.homepage.dart';

class Discover extends StatelessWidget {
  final ts = Get.find<ServiceTheme>();
  final DiscoverState controller = Get.put(DiscoverState());
  final infoService = Get.find<InformationService>();
  final dialogService = Get.find<DialogService>();
  final bool shouldShowUpButton;

  Discover({Key key, this.shouldShowUpButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 300,
      // child: Scaffold(
      //   // backgroundColor: Colors.red,
      //   // floatingActionButtonLocation: Platform.isAndroid
      //   //     ? FloatingActionButtonLocation.endFloat
      //   //     : FloatingActionButtonLocation.endDocked,
      //   floatingActionButton: FloatingActionButton(
      //     // mini: true,
      //     heroTag: "detail view fab",
      //     onPressed: () {
      //       if (infoService.isSignedIn.value)
      //         Get.to(() => CreatePost());
      //       else
      //         dialogService.showInfo(
      //             msg: "you need to be signed in to create a post",
      //             tag: "detail view fab");
      //     },

      //     child: Icon(
      //       CupertinoIcons.add_circled,
      //       color: ts.white,
      //     ),
      //   ),
      //   body:
      child: GetBuilder<DiscoverState>(
        init: controller,
        builder: (state) => Container(
          // child: RefreshIndicator(
          //   backgroundColor: ts.grey1,
          //   color: ts.red,
          //   onRefresh: () async {
          //     return controller.getPosts();
          //   },
          //   triggerMode: RefreshIndicatorTriggerMode.onEdge,
          //   child: NotificationListener<ScrollNotification>(
          //     onNotification: (notification) {
          //       if (notification is ScrollEndNotification &&
          //           notification.metrics.pixels >=
          //               notification.metrics.maxScrollExtent - 10) {
          //         controller.loadMorePosts();
          //         return true;
          //       }

          //       return false;
          //     },
          child: Column(
            // controller: controller.controller,
            // physics: AlwaysScrollableScrollPhysics(),
            children: [
              if (true)
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0),
                        borderRadius: BorderRadius.circular(2)),
                    height: 50,
                    width: Get.width,
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Text("options",
                                style: TextStyle(
                                    color: ts.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16))),
                        Spacer(),
                        Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: Icon(CupertinoIcons.sort_down))
                            .glass(),
                        InkWell(
                          onTap: () {
                            controller.showBottomFilter();
                          },
                          child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Icon(CupertinoIcons
                                      .square_stack_3d_down_right_fill))
                              .glass(),
                        ),
                      ],
                    )),
              if (controller.status.isSuccess)
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.front.length,
                    itemBuilder: (context, index) {
                      var e = controller.front.values.elementAt(index);
                      return PostItem(item: e).fadeInDown();
                    },
                  ),
                ),
              if (controller.status.isLoadingMore ||
                  controller.status.isLoading)
                Expanded(
                  child: ListView(
                    children: [
                      ...[1, 2, 3].map(
                        (e) {
                          return PostItem(
                            item: null,
                            isLoading: true,
                          ).fadeInDown(multiplier: e is int ? e * .5 : .5);
                        },
                      )
                    ],
                  ),
                ),
              if (controller.status.isEmpty)
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      controller.getPosts();
                    },
                    child: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.white,
                        child: Text("Nothing to see here")),
                  ),
                ),
              GetBuilder<HomePageState>(builder: (con) {
                return Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                      mainAxisAlignment: con.showArrow
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        InkWell(
                          onTap: () {
                            crazy.loginguard("create a post", () {
                              Get.to(() => CreatePost());
                            });
                          },
                          child: AnimatedContainer(
                            duration: Constants.durationShort,
                            width: con.showArrow ? 40 : Get.width / 3,
                            height: 40,
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.add_circled,
                                    size: 25,
                                  ),
                                  if (!con.showArrow)
                                    SizedBox(
                                      width: 10,
                                    ),
                                  AnimatedDefaultTextStyle(
                                    duration: Constants.durationShort,
                                    child: Text("create post"),
                                    style: con.showArrow
                                        ? TextStyle(
                                            fontSize: 0, color: Colors.black)
                                        : TextStyle(
                                            fontSize: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.9),
                                  borderRadius: BorderRadius.circular(
                                      con.showArrow ? 100 : Constants.br)),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          width: con.showArrow ? 15 : 0,
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: AnimatedOpacity(
                            duration: Constants.durationShort,
                            opacity: con.showArrow ? 1 : .0,
                            child: InkWell(
                              onTap: () {
                                con.animateToTop();
                              },
                              child: AnimatedContainer(
                                height: con.showArrow ? 40 : 0,
                                width: con.showArrow ? 40 : 0,
                                duration: Constants.durationShort,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 10),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1)),
                                child: Container(
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.arrow_upward,
                                    // color: Colors.white,
                                    size: 20,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
