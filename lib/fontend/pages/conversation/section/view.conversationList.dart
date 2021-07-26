import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/conversation/state.conversation.dart';

class ConversationList extends StatelessWidget {
  final cs = Get.find<ConversationState>();
  final ts = Get.find<ServiceTheme>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text("Messages").humungous(),
              SizedBox(
                height: 10,
              ),
              // Text("search bar"),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  child: Column(
                    children: [
                      // Text("list o fmessages"),
                      ...cs.map.values.map((e) {
                        return Container(
                          height: 50,
                          clipBehavior: Clip.antiAlias,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                              right: 14, top: 15, bottom: 15, left: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ts.bg.value,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                  color: ts.bg.value.darker())
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Image.network(
                                    e.getOthersUserInfo().userImageUrl),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        child: Row(
                                      children: [
                                        Container(
                                            width: Get.width / 3,
                                            child:
                                                Text(e.getOthersName()).h1()),
                                        // Text("").hdate(e.messages.last.)
                                      ],
                                    )),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(e.messages.last.content).h2()
                                  ],
                                ),
                              ),
                              Spacer(),
                              if (e.hasNewMessageForMe())
                                Container(
                                  width: 10,
                                  height: 10,
                                  // child: Icon(
                                  //   Icons.fiber_new_outlined,
                                  //   color: Colors.white,
                                  // ).linearGradientMask(
                                  //     [ts.pc.shade300, ts.pc.shade800]),
                                  alignment: Alignment.center,
                                  // child: Text("!").h1(),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          offset: Offset(2, 4),
                                          color: Colors.black12),
                                      BoxShadow(
                                          blurRadius: 0,
                                          offset: Offset(0, 0),
                                          color: ts.pc)
                                    ],
                                    // color: Colors.amber,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ).linearGradientMask(
                                    [ts.pc.shade100, ts.pc.shade400])
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ).background();
  }
}
