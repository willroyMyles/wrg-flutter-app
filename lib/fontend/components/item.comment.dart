import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/avatar.dart';
import 'package:wrg2/fontend/pages/discover_details/state.details.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class CommentItem extends StatelessWidget {
  final CommentModel item;
  final ts = Get.find<ServiceTheme>();
  final controller = Get.find<FeedDetailsState>();
  final loading;

  CommentItem({Key key, this.item, this.loading = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (loading) return buildLoading();
    return buildComment();
  }

  final baseCol = Colors.grey;
  final highCol = Colors.white;

  Container buildComment() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      margin: EdgeInsets.symmetric(horizontal: 1, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Constants.br),
        boxShadow: [
          BoxShadow(
              blurRadius: 2,
              offset: Offset(0, 2),
              color: ts.grey.withOpacity(.1))
        ],
        // border: Border.all(color: ts.bg.value, width: 0),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            WRGAvatar(
                              // size: 25,
                              imgSrc: item.userImageUrl,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.username).h2(),
                                  Text("").hdate(item.createdAt).h4()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width / 1.8,
                        margin: EdgeInsets.only(top: 5, left: 42),
                        child: Text(
                          item.content,
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      )
                    ],
                  ),
                ),
                if (item.isOffer)
                  Container(
                    padding: EdgeInsets.only(right: 0),
                    child: IconButton(
                      onPressed: () {
                        controller.onCommentItemPressed(item);
                      },
                      icon: Icon(Icons.more_vert_rounded),
                      color: Colors.grey,
                      iconSize: 28,
                      padding: EdgeInsets.all(4),
                    ),
                  ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 150),
            height: controller.isShowing && controller.id == item.id ? 60 : 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                        onPressed: () {
                          crazy.loginguard("report an user", () {});
                        },
                        child: Text("report"))
                    .secondary(),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                        onPressed: () {
                          crazy.loginguard("send a message", () {
                            controller.onSendMessagePressed(item);
                          });
                        },
                        child: Text("send message"))
                    .primary()
                    .elasticIn(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildLoading() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      margin: EdgeInsets.symmetric(horizontal: 1, vertical: 16),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(Constants.br),

        // border: Border.all(color: ts.bg.value, width: 0),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FadeShimmer.round(
                              size: 32,
                              baseColor: baseCol,
                              highlightColor: highCol,
                              millisecondsDelay: 0,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            FadeShimmer(
                              width: 200,
                              height: 15,
                              baseColor: baseCol,
                              highlightColor: highCol,
                              millisecondsDelay: 200,
                            )
                          ],
                        ),
                      ),
                      Container(
                          width: Get.width / 1.5,
                          margin: EdgeInsets.only(top: 5, left: 36),
                          child: FadeShimmer(
                            width: Get.width - 34,
                            height: 15,
                            baseColor: baseCol,
                            highlightColor: highCol,
                            millisecondsDelay: 400,
                          ))
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(right: 0),
                    child: FadeShimmer(
                      width: 10,
                      height: 50,
                      baseColor: baseCol,
                      highlightColor: highCol,
                      millisecondsDelay: 450,
                    )),
              ],
            ),
          ),
        ],
      ),
    ).fadeInDown();
  }
}
