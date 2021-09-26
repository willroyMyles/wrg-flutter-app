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
    controller.updateConversation(item.id);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text(item.getOthersName()).h1(),
        elevation: 10,
        shadowColor: Colors.green.withOpacity(.1),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.more_vert_sharp),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        // color: ts.fg.value,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(Get.context).unfocus();
          },
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
        ),
      ),
    );
  }

  Container buildMessage(int index) {
    var iam = item.amISender(item.messages.elementAt(index));
    var children = [
      Container(
          height: 30,
          width: 30,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.only(right: iam ? 0 : 10, left: iam ? 10 : 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.2))
              ]),
          child: Image.network(iam
              ? controller.service.userInfo.value.userImageUrl
              : item.getOthersUserInfo().userImageUrl)),
      Container(
        width: Get.width / 1.9,
        alignment: iam ? Alignment.topRight : Alignment.topLeft,
        child: Text(
          item.messages.elementAt(index).content.toString(),
          textAlign: iam ? TextAlign.right : TextAlign.left,
          overflow: TextOverflow.fade,
          softWrap: true,
          maxLines: 100,
        ),
      ),
    ];
    return Container(
      alignment: iam ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(
          // color: ts.fg.value,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            // BoxShadow(
            //     blurRadius: 1,
            //     offset: Offset(3, 5),
            //     color: ts.fgt.value.withOpacity(.1))
          ],
          // border: Border.all(width: 3, color: ts.bg.value.darker())
        ),
        child: Row(
            mainAxisAlignment:
                iam ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: iam ? children.reversed.toList() : children),
      ),
    );
  }
}
