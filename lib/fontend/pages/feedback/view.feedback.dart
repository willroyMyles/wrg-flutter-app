import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.executor.dart';
import 'package:wrg2/fontend/pages/profile/state.profile.dart';

class FeedbackView extends StatelessWidget {
  FeedbackView({Key key}) : super(key: key);
  final controller = Get.find<ProfileState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(CupertinoIcons.back),
      ),
      body: Container(
        // height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.textEditingController,
            ).input(label: "feedback", minLines: 10),
            SizedBox(
              height: 10,
            ),
            FlatButton(
                onPressed: () {
                  controller.cal.crazy();
                  var p = controller.sendMessage.runtimeType;
                  print(p);
                },
                child: Text(
                  "send feedback",
                )).primary()
          ],
        ),
      ),
    );
  }
}
