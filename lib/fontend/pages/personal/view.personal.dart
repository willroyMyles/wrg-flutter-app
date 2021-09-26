import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/pages/conversation/section/view.conversationSection.dart';
import 'package:wrg2/fontend/pages/watching/section/view.watchingSection.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  final infoService = Get.find<InformationService>();
  final service = Get.find<APIService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  toolbarHeight: 50,
                  title: Obx(() => infoService.isSignedIn.value
                      ? Text(
                          "Hello ${service.userInfo.value.username}",
                          style: TextStyle(color: ts.grey),
                        )
                      : Text("personal")),
                  leading: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Obx(
                        () => infoService.isSignedIn.value
                            ? CircleAvatar(
                                backgroundImage: Image.network(
                                        service.userInfo.value.userImageUrl)
                                    .image,
                                radius: 10,
                              )
                            : Icon(
                                CupertinoIcons.person,
                              ),
                      ),
                    ),
                  ),
                ),
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
    );
  }
}
