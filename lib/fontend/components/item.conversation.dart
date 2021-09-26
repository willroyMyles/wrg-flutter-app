import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/conversation/state.conversation.dart';
import 'package:wrg2/fontend/pages/conversation/view.conversation.dart';

class ConversationItem extends StatelessWidget {
  ConversationItem({
    Key key,
    this.model,
  }) : super(key: key);

  final ConversationModel model;
  final ServiceTheme ts = Get.find();
  final controller = Get.find<ConversationState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      margin: EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Stack(
        children: [
          Positioned(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(.4),
            ),
          )),
          Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            margin: EdgeInsets.only(right: 20, top: 5, bottom: 5, left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: ts.fg.value,
              // boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)]
            ),
            child: InkWell(
              onTap: () {
                Get.to(() => ConversationView(
                      item: model,
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child:
                        Image.network(model.getOthersUserInfo().userImageUrl),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(model.getOthersName()).h1(),
                  SizedBox(
                    height: 3,
                  ),
                  Text(model.messages.last.content).h3(),
                  SizedBox(
                    height: 4,
                  ),
                  Spacer(),
                  if (model.hasNewMessageForMe())
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
                          BoxShadow(blurRadius: 0, offset: Offset(0, 0))
                        ],
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ).linearGradientMask([
                      // ts.pc.shade100, ts.pc.shade400
                    ]),
                  Text("").hdate(DateTime.now()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
