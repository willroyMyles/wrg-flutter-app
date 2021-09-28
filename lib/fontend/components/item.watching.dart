import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/discover_details/view.details.dart';

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
      child: InkWell(
        onTap: () {
          Get.to(() => DiscoverDetails(
                item: element,
              ));
        },
        child: Container(
          margin: EdgeInsets.only(
              left: index != null ? 25.0 * (index != null ? index : 1) : 0),
          height: 180,
          width: 200,
          // constraints: BoxConstraints(maxHeight: 180, maxWidth: 200),
          decoration: BoxDecoration(
              color: ts.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(blurRadius: 15, color: ts.grey.withOpacity(.2))
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
                    Container(
                      child: Transform.scale(
                        scale: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 0),
                              width: 45,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${element.watching}"),
                                  Icon(CupertinoIcons.eyeglasses),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${element.views}"),
                                  Icon(CupertinoIcons.eye),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 0),
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.0),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        color: Colors.black.withOpacity(.0))
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${element.commentss}"),
                                  Icon(CupertinoIcons.chat_bubble),
                                ],
                              ),
                            ),
                          ],
                        ),
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
        ),
      ),
    );
  }
}
