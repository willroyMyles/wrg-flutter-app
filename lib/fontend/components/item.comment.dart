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

  CommentItem({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildComment();
  }

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
                            Text(item.username)
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width / 1.3,
                        margin: EdgeInsets.only(top: 5),
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
                FlatButton(onPressed: () {}, child: Text("report")).secondary(),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                        onPressed: () {
                          controller.onSendMessagePressed(item);
                        },
                        child: Text("send message"))
                    .primary(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
