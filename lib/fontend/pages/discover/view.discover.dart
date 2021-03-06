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

class Discover extends StatelessWidget {
  final ts = Get.find<ServiceTheme>();
  final DiscoverState controller = Get.put(DiscoverState());
  final infoService = Get.find<InformationService>();
  final dialogService = Get.find<DialogService>();

  List<Widget> getBody() {
    return [
      if (true)
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.transparent,
          title: Container(
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
                            child: Icon(
                                CupertinoIcons.square_stack_3d_down_right_fill))
                        .glass(),
                  ),
                ],
              )),
        ),
      if (controller.status.isSuccess)
        SliverPadding(
          padding: EdgeInsets.only(top: 10),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ...controller.front.values
                  .map(
                    (e) => PostItem(item: e).fadeInDown(),
                  )
                  .toList()
            ]),
          ),
        ),
      if (controller.status.isLoadingMore || controller.status.isLoading)
        SliverPadding(
          padding: EdgeInsets.only(),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ...[1, 2, 3].map(
                (e) {
                  return PostItem(
                    item: null,
                    isLoading: true,
                  ).fadeInDown(multiplier: e is int ? e * .5 : .5);
                },
              )
            ]),
          ),
        ),
      if (controller.status.isSuccess && controller.noMorePosts)
        SliverToBoxAdapter(
          child: AnimatedContainer(
            duration: Constants.durationLong,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 50, bottom: 60),
            child: Text("no more posts",
                style: TextStyle(
                  color: ts.grey,
                  fontSize: 25,
                )),
          ).fadeInUp(),
        ),
      if (controller.status.isEmpty)
        SliverFillRemaining(
          child: Container(
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
        ),
    ];
  }

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
              // if (false)
              // SliverPadding(
              //   padding: EdgeInsets.only(top: 30),
              //   sliver: SliverAppBar(
              //     floating: true,
              //     title: Container(
              //         height: 50,
              //         width: Get.width,
              //         margin: EdgeInsets.only(top: 0),
              //         alignment: Alignment.center,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             ...controller.states.map(
              //               (e) {
              //                 var index = controller.states.indexOf(e);
              //                 var isSelected =
              //                     index == controller.currentStateIndex;
              //                 return InkWell(
              //                   onTap: () {
              //                     controller.onStateTapped(index);
              //                   },
              //                   child: Container(
              //                     padding: EdgeInsets.all(5),
              //                     child: Text(
              //                       e.capitalize,
              //                       textScaleFactor: 1,
              //                       style: TextStyle(
              //                           color:
              //                               isSelected ? ts.red : ts.grey,
              //                           fontWeight: FontWeight.w600,
              //                           fontSize: 16),
              //                     ),
              //                   ),
              //                 );
              //               },
              //             )
              //           ],
              //         )),
              //   ),
              // ),
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
                Padding(
                  padding: EdgeInsets.only(),
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
