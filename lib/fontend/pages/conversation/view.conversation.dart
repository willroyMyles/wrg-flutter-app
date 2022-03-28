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
    var appbarHeight = Get.mediaQuery.viewPadding.top + 100;
    var inputHeight = 100;
    var remaining = Get.height - appbarHeight - inputHeight;
    var bottom = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
        appBar: AppBar(
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
          toolbarHeight: 100,
          bottom: PreferredSize(
            preferredSize: Size(Get.width, 80),
            child: Container(
              color: ts.grey1,
              child: Column(
                children: [
                  if (controller.list.isNotEmpty &&
                          !item.amISender(controller.list?.elementAt(0)) ??
                      false)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            "accept".capitalize,
                            textScaleFactor: 1,
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                          color: Colors.transparent,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            "decline".capitalize,
                            textScaleFactor: 1,
                            style: TextStyle(color: ts.red, fontSize: 18),
                          ),
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
        extendBody: false,
        extendBodyBehindAppBar: false,
        body: GetBuilder<ConversationState>(
          init: controller,
          builder: (controller) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Stack(
                children: [
                  Positioned(
                    bottom: bottom > 10
                        ? MediaQuery.of(context).viewInsets.bottom - 336 + 110
                        : 110,
                    child: Column(
                      children: [
                        if (controller.status.isSuccess)
                          Container(
                            height: remaining,
                            width: Get.width,
                            child: ListView.builder(
                              // physics: ClampingScrollPhysics(),
                              padding: EdgeInsets.only(top: 25),
                              controller: controller.listViewController,
                              itemCount: controller.list.length,
                              itemBuilder: (context, index) {
                                var e = controller.list.elementAt(index);
                                return MessageItem(
                                    model: e,
                                    other: other,
                                    amISender: item.amISender(e),
                                    index: index);
                              },
                            ),
                          ),
                        if (controller.status.isLoading)
                          Container(
                            height: remaining,
                            width: Get.width,
                            child: LoadingView(),
                          ),
                        if (controller.status.isEmpty) Constants.empty(),
                        // Container(
                        //     height: 100,
                        //     width: Get.width,
                        //     padding: EdgeInsets.only(
                        //         bottom: 20, left: 10, right: 10),
                        //     child: Row(
                        //       mainAxisAlignment:
                        //           MainAxisAlignment.spaceAround,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         Container(
                        //             width: Get.width - 100,
                        //             child: TextFormField(
                        //               controller: controller.textControler,
                        //             ).input(label: "send a message...")),
                        //         LoadingButton(
                        //           icon: CupertinoIcons.paperplane,
                        //           loading: controller.loading,
                        //           callback: () {
                        //             controller.sendMessage(item);
                        //           },
                        //         )
                        //       ],
                        //     ))
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                          height: 100,
                          width: Get.width,
                          padding:
                              EdgeInsets.only(bottom: 20, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: Get.width - 100,
                                  child: TextFormField(
                                    controller: controller.textControler,
                                  ).input(label: "send a message...")),
                              LoadingButton(
                                icon: CupertinoIcons.paperplane,
                                loading: controller.loading,
                                callback: () {
                                  controller.sendMessage(item);
                                },
                              )
                            ],
                          ))),
                ],
              ),
            );
          },
        ));
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
                              .secondary(),
                          FlatButton(onPressed: () {}, child: Text("Decline"))
                              .secondary(),
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
                    ])),
                  SliverToBoxAdapter(
                    child: Container(
                      child: TextFormField(),
                    ),
                  )
                ],
              );
            }));
  }
}
