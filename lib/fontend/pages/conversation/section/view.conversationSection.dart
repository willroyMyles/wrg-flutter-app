import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/conversation/section/view.conversationList.dart';
import 'package:wrg2/fontend/pages/conversation/state.conversation.dart';

class ConversationSection extends StatelessWidget {
  var controller = Get.put(ConversationState());
  var ts = Get.find<ServiceTheme>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationState>(builder: (controller) {
      if (controller.status.isEmpty)
        return Container(
          alignment: Alignment.center,
          height: 100,
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(7)),
          child: Text("No Conversations As Yet...").hunch(),
        );
      if (controller.status.isSuccess)
        return Container(
            width: Get.width,
            height: 150,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: ts.fg.value,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.map.length.toString() + " Conversation").h1(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.map.values
                                      .takeWhile(
                                          (value) => value.hasNewMessageForMe())
                                      .length
                                      .toString() +
                                  " New Messages")
                              .h2(),
                          SizedBox(
                            height: 3,
                          ),
                          SizedBox(height: 10),
                          FlatButton(
                                  onPressed: () {
                                    Get.to(() => ConversationList());
                                  },
                                  child: Text("view conversations"))
                              .primary()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));

      return Container();
    });
  }
}
