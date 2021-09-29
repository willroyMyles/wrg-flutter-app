import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/avatar.dart';
import 'package:wrg2/fontend/pages/comment/state.comment.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/fontend/pages/discover_details/state.details.dart';

class DiscoverDetails extends StatelessWidget {
  final PostModel item;
  final String tag;

  DiscoverDetails({Key key, this.item, this.tag = "tag"}) : super(key: key);

  final ts = Get.find<ServiceTheme>();
  final controller = Get.put(FeedDetailsState());

  @override
  Widget build(BuildContext context) {
    controller.setPostModel(item);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // backgroundColor: ts.grey1,
      bottomNavigationBar: InkWell(
        onTap: () {
          controller.onCommentPressed(item);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 40),
          width: Get.width,
          child: GetBuilder<FeedDetailsState>(
            init: controller,
            builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 0),
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
                      Text("${item.watching}"),
                      Icon(CupertinoIcons.eyeglasses),
                    ],
                  ),
                ).fadeInDown(multiplier: 2),
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
                      Text("${item.views}"),
                      Icon(CupertinoIcons.eye),
                    ],
                  ),
                ).fadeInDown(multiplier: 3),
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
                            blurRadius: 1, color: Colors.black.withOpacity(.0))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${item.commentss}"),
                      Icon(CupertinoIcons.chat_bubble),
                    ],
                  ),
                ).fadeInDown(multiplier: 4),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ts.white,
        centerTitle: true,
        title: Text(
          item.title,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(color: ts.grey2),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Hero(
              tag: tag,
              child: Container(
                // margin: EdgeInsets.only(top: 100),
                padding: EdgeInsets.all(18),
                color: ts.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    Divider(),
                    Text(item.content).h1(),
                    Divider(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(item.make).h3(),
                          Text(item.model).h3(),
                          Text(item.year.toString()).h3(),
                        ],
                      ),
                    ),
                    Text(item.category).h3(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          if (item.userInfo?.userImageUrl != null)
                            WRGAvatar(
                              size: 25,
                              imgSrc: item.userInfo.userImageUrl,
                            ),
                          if (item.userInfo?.username != null)
                            Text(item.userInfo.username).h2(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder(
              init: controller,
              builder: (controller) => Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () {
                        crazy.loginguard("watch this item", () {
                          controller.onWatchPressed(item);
                        });
                      },
                      child:
                          Text(item.isWatching() ? "stop watching" : "watch"),
                      // color: ts.fg.value,
                    ).secondary(),
                    // FlatButton(
                    //   onPressed: () {},
                    //   child: Text("comment"),
                    //   color: ts.fg.value,
                    // ).secondary(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ).gradient();
  }
}
