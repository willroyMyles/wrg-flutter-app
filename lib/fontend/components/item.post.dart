import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/discover_details/view.details.dart';

class PostItem extends StatelessWidget {
  final PostModel item;

  PostItem({Key key, this.item}) : super(key: key);

  final ts = Get.find<ServiceTheme>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: ts.fg.value, borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Get.to(() => DiscoverDetails(
                item: item,
              ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        Image.network(item.userInfo.userImageUrl).image,
                    radius: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(item.userInfo.username),
                ],
              ),
            ),
            Text(item.title),
            Text(item.content),
            Text(item.title),
            Text(item.title),
          ],
        ),
      ),
    );
  }
}
