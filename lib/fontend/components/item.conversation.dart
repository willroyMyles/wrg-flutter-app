import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/fontend/pages/conversation/view.conversation.dart';

class ConversationItem extends StatelessWidget {
  final ConversationModel item;

  const ConversationItem({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.green),
      child: InkWell(
        onTap: () {
          Get.to(() => ConversationView(
                item: item,
              ));
        },
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Text(item.getOthersName()).h1(),
                  Container(
                    child: Column(
                      children: [
                        Text(item.messages.last.content).h3(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Positioned(
            //   child: Container(
            //     height: 300,
            //     width: 300,
            //     child: Text(item.messages.length.toString()).humungous(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
