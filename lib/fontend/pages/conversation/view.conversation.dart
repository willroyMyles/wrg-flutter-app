import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/services/service.dialog.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/conversation/state.conversation.dart';

class ConversationView extends StatelessWidget {
  final ConversationModel item;
  final ts = Get.find<ServiceTheme>();
  final ConversationState controller = Get.find<ConversationState>();
  final dialog = Get.find<DialogService>();

  ConversationView({Key key, this.item}) : super(key: key);
  Widget build(BuildContext context) {
    dialog.closeDialog();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(item.getOthersName()).h1(),
        elevation: 0,
      ),
      body: Container(
        color: ts.fg.value,
        child: GetBuilder(
          init: controller,
          builder: (controller) => Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      itemBuilder: (context, index) {
                        return buildMessage(index);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 19,
                          ),
                      itemCount: item.messages.length),
                ),
                Container(
                  height: 100,
                  width: Get.width,
                  padding: EdgeInsets.all(5),
                  // color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 100,
                          width: Get.width - 60,
                          child: TextFormField(
                            controller: controller.textControler,
                          ).input(label: "send message")),
                      InkWell(
                        onTap: () {
                          controller.sendMessage(item);
                        },
                        child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  // BoxShadow(
                                  //     blurRadius: 0,
                                  //     color: Colors.black.withOpacity(.2))
                                ]),
                            child: Icon(CupertinoIcons.paperplane)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ).background(),
    );
  }

  Container buildMessage(int index) {
    return Container(
      alignment: item.amISender(item.messages.elementAt(index))
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(
            color: ts.fg.value,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              // BoxShadow(
              //     blurRadius: 1,
              //     offset: Offset(3, 5),
              //     color: ts.fgt.value.withOpacity(.1))
            ],
            border: Border.all(width: 0, color: ts.bg.value.darker())),
        child: Text(item.messages.elementAt(index).content.toString()).h2(),
      ),
    );
  }
}
