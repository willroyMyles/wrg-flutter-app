import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/messages.dart';
import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/backend/services/service.constants.dart';

class MessageItem extends StatelessWidget {
  final MessagesModel model;
  final UserInfoModel other;
  final bool amISender;
  final int index;
  const MessageItem(
      {Key key, this.model, this.other, this.amISender, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          Container(
              // width: 100,
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: ts.grey1.withOpacity(1),
                  border: Border(
                      right: BorderSide.none,
                      top: BorderSide.none,
                      bottom: BorderSide.none,
                      left: BorderSide(
                          color: amISender ? ts.grey : ts.red, width: 7))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text((amISender ? 'you' : "${other.username}") + "  ",
                            style: getStyle()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("- ").hdate(model.createdAt),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    model.content,
                    textScaleFactor: 1,
                    style: getStyle(),
                  ),
                ],
              )),
          IntrinsicHeight(
            child: Container(
              width: 10,
              color: ts.red,
              // height: 100,
            ),
          ),
        ],
      ),
    ).fadeInDown(multiplier: index * .1);
  }

  getStyle() {
    return TextStyle(color: ts.white);
  }
}
