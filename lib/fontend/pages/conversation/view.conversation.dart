import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.dialog.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/conversation/state.conversation.dart';

class ConversationView extends StatelessWidget {
  final ConversationModel item;
  final ts = Get.find<ServiceTheme>();
  final controller = Get.find<ConversationState>();
  final dialog = Get.find<DialogService>();

  ConversationView({Key key, this.item}) : super(key: key);
  Widget build(BuildContext context) {
    dialog.closeDialog();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialog.showDialog(Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 9,
                    controller: controller.textControler,
                    focusNode: controller.fn,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        helperText: "Send message to ${item.getOthersName()}",
                        labelText: "Enter Message"),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  FlatButton(
                          onPressed: () {
                            controller.sendMessage(item);
                          },
                          child: Text("send message"))
                      .primary()
                ],
              ),
            ),
          ));
        },
        child: Icon(
          Icons.message,
          color: ts.fgt.value,
        ),
        // elevation: 30,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Texxt(item.getOthersName()).h1(),
        elevation: 0,
      ),
      body: Container(
        child: GetBuilder(
          init: controller,
          builder: (controller) => ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(3),
                  alignment: item.amISender(item.messages.elementAt(index))
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    decoration: BoxDecoration(
                        color: ts.fg.value,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              offset: Offset(3, 3),
                              color: ts.fgt.value.withOpacity(.1))
                        ],
                        border:
                            Border.all(width: 0, color: ts.bg.value.darker())),
                    child:
                        Texxt(item.messages.elementAt(index).content.toString())
                            .h2(withStr: false),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
              itemCount: item.messages.length),
        ),
      ).background(),
    );
  }
}
