import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wrg2/backend/enums/enum.post.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/item.post.dart';
import 'package:wrg2/fontend/pages/create/view.create.dart';
import 'package:wrg2/fontend/pages/discover/state.discover.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover>
    with AutomaticKeepAliveClientMixin {
  final ts = Get.find<ServiceTheme>();
  final DiscoverState controller = Get.put(DiscoverState());
  final infoService = Get.find<InformationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreatePost());
        },
        child: Icon(CupertinoIcons.add_circled),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ts.grey1,
      ).glass(),
      body: GetBuilder<DiscoverState>(
        init: controller,
        builder: (state) => VisibilityDetector(
          key: ValueKey("fab vis"),
          onVisibilityChanged: (info) {
            var val = info.visibleFraction > .5;
            infoService.updateFab(val);
          },
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                if (controller.status.isSuccess)
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 100, top: 10),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        ...controller.map.values
                            .map(
                              (e) => PostItem(item: e),
                            )
                            .toList()
                      ]),
                    ),
                  ),
                if (controller.status.isEmpty)
                  SliverFillRemaining(
                    child: Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          controller.getMorePosts();
                        },
                        child: Container(
                            padding: EdgeInsets.all(20),
                            color: Colors.white,
                            child: Text("Nothing to see here")),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );

    print("building discover");
    return Scaffold(
      body: InkWell(
        onTap: controller.onTap(),
        child: Container(
            // margin: EdgeInsets.only(top: 25),
            width: Get.width,
            alignment: Alignment.center,
            child: controller.obx(
              (state) {
                return Container(
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      // Container(
                      //   width: Get.width,
                      //   padding: EdgeInsets.only(bottom: 8),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       FlatButton.icon(
                      //           onPressed: () {},
                      //           icon: Opacity(
                      //               opacity: .5,
                      //               child: Icon(
                      //                 Icons.keyboard_arrow_down,
                      //               )),
                      //           label: Text(controller.filter
                      //                   .elementAt(controller.filterIndex))
                      //               .h1())
                      //     ],
                      //   ),
                      // ),
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 30),
                            itemBuilder: (context, index) {
                              return PostItem(
                                  item: controller.info.feed.values
                                      .elementAt(index));
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                            itemCount: controller.info.feed.values.length),
                      ),
                    ],
                  ),
                );
              },
              onEmpty: InkWell(
                  onTap: () => controller.getMorePosts(), child: emptySvg()),
              onError: (err) => Container(
                color: Colors.green,
                child: Text("error"),
              ),
              onLoading: Container(
                child: Text("loading"),
              ),
            )),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
