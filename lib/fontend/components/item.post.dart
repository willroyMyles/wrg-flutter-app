import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/imageForCategory.dart';
import 'package:wrg2/fontend/pages/discover_details/view.details.dart';

class PostItem extends StatelessWidget {
  final PostModel item;

  PostItem({Key key, this.item}) : super(key: key);

  final ts = Get.find<ServiceTheme>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(12),
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
          color: ts.fg.value, borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        onTap: () {
          Get.to(() => DiscoverDetails(
                item: item,
              ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width * .6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       CircleAvatar(
                  //         backgroundImage:
                  //             Image.network(item.userInfo.userImageUrl).image,
                  //         radius: 15,
                  //       ),
                  //       SizedBox(
                  //         width: 10,
                  //       ),
                  //       Text(item.userInfo.username),
                  //     ],
                  //   ),
                  // ),
                  Texxt(item.title).h1(),
                  Texxt(item.content).h2(withStr: false),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Texxt(item.make).h3(),
                        Texxt(item.model).h3(),
                        Texxt(item.year.toString()).h3(),
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
    );
  }
}
