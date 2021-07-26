import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/enums/enum.post.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/item.post.dart';
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

  @override
  Widget build(BuildContext context) {
    print("building discover");
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      // floatingActionButton: Container(
      //   margin: EdgeInsets.only(
      //     bottom: 0,
      //   ),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       controller.onFAB();
      //     },
      //     child: Container(
      //       child: Icon(
      //         Icons.add,
      //         color: ts.fgt.value,
      //       ),
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        // backgroundColor: ts.bg.value,
        shadowColor: ts.bg.value.darker().withOpacity(.4),
        elevation: 0,
        title: Text("Discover".toUpperCase()).h1(),
        centerTitle: true,
        leadingWidth: 64,
        leading: FlatButton.icon(
            onPressed: () {}, icon: Icon(Icons.menu), label: Text("")),
        actions: [
          Container(
            child: Icon(
              Icons.search,
              color: ts.fgt.value,
            ),
          ),
        ],
      ),
      body: InkWell(
        onTap: controller.onTap(),
        child: Container(
            margin: EdgeInsets.only(top: 25),
            width: Get.width,
            alignment: Alignment.center,
            child: controller.obx(
              (state) {
                return Container(
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // FlatButton.icon(
                            //     onPressed: () {},
                            //     icon: Opacity(
                            //         opacity: .5,
                            //         child: Icon(
                            //           Icons.keyboard_arrow_down,
                            //         )),
                            //     label: Text(controller.filter
                            //             .elementAt(controller.filterIndex))
                            //         .h1())
                          ],
                          // children: [
                          //   ...Status.values.map((e) {
                          //     return Container(
                          //       alignment: Alignment.center,
                          //       padding: EdgeInsets.symmetric(
                          //           horizontal: 12, vertical: 8),
                          //       decoration: BoxDecoration(
                          //           color: ts.fg.value,
                          //           borderRadius: BorderRadius.circular(4),
                          //           border: Border.all(
                          //               color: ts.bg.value.darker(), width: 1)
                          //           // boxShadow: [
                          //           //   BoxShadow(
                          //           //     blurRadius: 0,
                          //           //     offset: Offset(1, 3),
                          //           //     color: Colors.grey.shade300,
                          //           //   )
                          //           // ],
                          //           ),
                          //       child: Text(e.toCommonString()).hint(),
                          //     );
                          //   }).toList()
                          // ],
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 30),
                            itemBuilder: (context, index) {
                              return PostItem(
                                  // item: controller.map.values.elementAt(index),
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
    ).background();
  }

  @override
  bool get wantKeepAlive => true;
}
