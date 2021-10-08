import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.dialog.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/item.message.dart';
import 'package:wrg2/fontend/components/loading.dart';
import 'package:wrg2/fontend/components/loadingButton.dart';
import 'package:wrg2/fontend/pages/conversation/state.conversation.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class ConversationView extends StatelessWidget {
  final ConversationModel item;
  final UserInfoModel other;
  final ts = Get.find<ServiceTheme>();
  final ConversationState controller = Get.put(ConversationState());
  final dialog = Get.find<DialogService>();

  ConversationView({Key key, this.item, this.other}) : super(key: key);
  Widget build(BuildContext context) {
    controller.setId(item.id);
    dialog.closeDialog();
    return Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.chat_bubble_2_fill),
          onPressed: () {},
          backgroundColor: ts.grey1,
        ),
        body: GetBuilder<ConversationState>(
            init: controller,
            builder: (_) {
              return CustomScrollView(
                // dragStartBehavior: DragStartBehavior.,
                controller: controller.listViewController,
                slivers: [
                  SliverAppBar(
                    title: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "messages with",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: ts.white.withOpacity(.3))),
                      TextSpan(text: "\n ${other.username}"),
                    ])),
                    automaticallyImplyLeading: true,
                    backgroundColor: ts.grey1,
                    pinned: true,
                  ),
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    primary: false,
                    toolbarHeight: 70,
                    titleSpacing: 0,
                    title: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FlatButton(onPressed: () {}, child: Text("Accept"))
                              .primary(),
                          FlatButton(onPressed: () {}, child: Text("Decline"))
                              .primary(),
                        ],
                      ),
                    ),
                    floating: true,
                  ),
                  if (controller.status.isSuccess)
                    SliverList(
                        delegate: SliverChildListDelegate([
                      ...controller.list.map((e) => MessageItem(
                          model: e,
                          other: other,
                          amISender: item.amISender(e),
                          index: controller.list.indexOf(e))),
                      SizedBox(
                        height: 120,
                      )
                    ]))
                ],
              );
            }));
  }
}
