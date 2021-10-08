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
      alignment: amISender ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      child: Container(
          width: Get.width / 1.5,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: amISender ? ts.grey1 : ts.grey,
            borderRadius: BorderRadius.circular(Constants.br),
          ),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text((amISender ? 'you' : "${other.username}") + "  ",
                        style: getStyle()),
                    Text("- ").hdate(model.createdAt)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                model.content,
                textScaleFactor: 1,
                style: getStyle(),
              ),
            ],
          ))),
    ).fadeInDown(multiplier: index * .1);
  }

  getStyle() {
    return TextStyle(color: ts.white);
  }
}
