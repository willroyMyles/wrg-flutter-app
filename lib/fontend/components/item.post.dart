import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.helper.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/imageForCategory.dart';
import 'package:wrg2/fontend/pages/discover_details/view.details.dart';

class PostItem extends StatelessWidget {
  final PostModel item;

  PostItem({Key key, this.item}) : super(key: key);

  final ts = Get.find<ServiceTheme>();
  final tag = getTag();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: EdgeInsets.all(12),
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
            color: ts.fg.value, borderRadius: BorderRadius.circular(4)),
        child: InkWell(
          onTap: () {
            Get.to(() => DiscoverDetails(item: item, tag: tag));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * .6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title).h1(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.content,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ).h2(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.make).h3(),
                          Text(item.model).h3(),
                          Text(item.year.toString()).h3(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: Get.width * .2,
                clipBehavior: Clip.none,
                child: ImageForCategory(
                  item: item,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
