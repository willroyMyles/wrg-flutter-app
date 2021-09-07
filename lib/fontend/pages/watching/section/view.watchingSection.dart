import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/imageForCategory.dart';

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
    return SliverPadding(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 40),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            PostModel element =
                informationService.watching.values.elementAt(index);
            return Container(
              height: 180,
              decoration: BoxDecoration(
                  color: ts.fg.value,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(blurRadius: 3, color: ts.bg.value.darker())
                  ]),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 2,
                    right: 7,
                    child: Opacity(
                      opacity: .5,
                      child: Container(
                        child: ImageForCategory(
                          item: element,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 180,
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: Get.width / 4,
                                  child: Text(element.title).h1()),
                              Container(
                                  width: Get.width / 7.4,
                                  child: Text("").hdate(element.createdAt)),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [Text("some icons here")],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(element.make).h1(),
                              Text(element.model).h1(),
                              Text(element.year.toString()).h1(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: informationService.watching.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1),
      ),
    );
  }

  Widget buildEmpty() {
    return SliverToBoxAdapter(
      child: Container(
        height: 50,
        width: Get.width,
        alignment: Alignment.center,
        child: Text("not watching any posts").hunch(),
      ),
    );
  }
}
