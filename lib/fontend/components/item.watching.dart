import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.theme.dart';

import 'imageForCategory.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class WatchingItem extends StatelessWidget {
  WatchingItem({
    Key key,
    @required this.element,
    this.index,
  }) : super(key: key);

  final PostModel element;
  final int index;

  final ts = Get.find<ServiceTheme>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.only(
            left: index != null ? 25.0 * (index != null ? index : 1) : 0),
        height: 180,
        width: 200,
        // constraints: BoxConstraints(maxHeight: 180, maxWidth: 200),
        decoration: BoxDecoration(
            color: ts.fg.value,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [BoxShadow(blurRadius: 3, color: ts.bg.value.darker())]),
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
              // height: 180,
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
                  // Container(
                  //   child: Row(
                  //     children: [Text("some icons here")],
                  //   ),
                  // ),
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
      ),
    );
  }
}
