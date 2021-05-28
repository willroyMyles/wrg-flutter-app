import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/avatar.dart';

class CommentItem extends StatelessWidget {
  final CommentModel item;
  final ts = Get.find<ServiceTheme>();

  CommentItem({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Container(
        decoration: BoxDecoration(
          color: ts.fg.value,
          borderRadius: BorderRadius.circular(Constants.br),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: Offset(0, 5),
                color: ts.bg.value.withOpacity(.5))
          ],
          border: Border.all(color: ts.bg.value, width: 0),
        ),
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
                          size: 25,
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
                    margin: EdgeInsets.only(top: 5),
                    child: Text(item.content),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_rounded),
                color: Colors.grey,
                iconSize: 28,
                padding: EdgeInsets.all(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
