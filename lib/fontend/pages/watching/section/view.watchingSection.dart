import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.helper.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/imageForCategory.dart';
import 'package:wrg2/fontend/components/item.watching.dart';
import 'package:wrg2/fontend/pages/watching/section/view.wtchingList.dart';

class WatchingSection extends StatelessWidget {
  final InformationService informationService = Get.find();
  final ts = Get.find<ServiceTheme>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: informationService.watching.stream,
      builder: (context, snapshot) {
        return informationService.watching.length > 0
            ? buildList()
            : buildEmpty();
      },
    );
  }

  Widget buildList() {
    var length = informationService.watching.length;
    List<String> tags = [];

    return SliverPadding(
        padding: EdgeInsets.only(left: 12, right: 12, bottom: 40),
        sliver: SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () {
              Navigator.of(Get.context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return WatchingListView(tags: tags, anim: animation);
                },
                transitionDuration: Duration(milliseconds: 650),
                reverseTransitionDuration: Duration(milliseconds: 650),
              ));
            },
            child: Container(
                height: 300,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerLeft,
                      child: Text.rich(TextSpan(children: [
                        TextSpan(text: "your watching "),
                        TextSpan(
                            text: "$length",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 20)),
                        TextSpan(text: " posts"),
                      ])),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 130),
                        itemCount: length,
                        // reverse: false,
                        itemBuilder: (context, index) {
                          var idx = length - 1 - index;
                          PostModel element = informationService.watching.values
                              .toList()
                              // .reversed
                              .elementAt(idx);
                          tags.add(getTag());
                          return Transform.translate(
                            offset: Offset(-10.0 * index, -10.0 * index),
                            child: Align(
                              heightFactor: .0001,
                              child: Hero(
                                tag: tags.elementAt(index),
                                child: WatchingItem(
                                  element: element,
                                  // index: index,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }

  Widget buildEmpty() {
    return SliverToBoxAdapter(
      child: Container(
        width: Get.width,
        alignment: Alignment.center,
        height: 100,
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        child: Text("Not watching any posts as yet...").hunch(),
      ),
    );
  }
}
