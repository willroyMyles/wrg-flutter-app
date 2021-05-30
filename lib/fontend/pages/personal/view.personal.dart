import 'package:flutter/material.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/fontend/pages/conversation/section/view.conversationSection.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [ConversationSection()],
            ),
          )),
    ).background();
  }
}
