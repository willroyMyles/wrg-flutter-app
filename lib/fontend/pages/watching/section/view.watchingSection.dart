import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            PostModel element =
                informationService.watching.values.elementAt(index);
            return Container(
              height: 180,
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: ts.fg.value,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Texxt(element.title).h1(),
                              Texxt(element.createdAt.toString()).h3(),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Texxt(element.make).h1(),
                              Texxt(element.model).h1(),
                              Texxt(element.year.toString()).h1(),
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
        ),
      ),
    );
  }

  Widget buildEmpty() {
    return SliverToBoxAdapter(
      child: Container(
        height: 50,
        width: Get.width,
        alignment: Alignment.center,
        child: Texxt("not watching any posts").hunch(),
      ),
    );
  }
}
