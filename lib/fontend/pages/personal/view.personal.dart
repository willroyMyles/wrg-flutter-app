import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/pages/conversation/section/view.conversationSection.dart';
import 'package:wrg2/fontend/pages/watching/section/view.watchingSection.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  final infoService = Get.find<InformationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: ConversationSection(),
                ),
                // SliverToBoxAdapter(
                //     child: Container(
                //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                //   child: Text("posts your watching").hint(),
                // )),
                WatchingSection(),
              ],
            )),
      ),
    ).background();
  }
}
