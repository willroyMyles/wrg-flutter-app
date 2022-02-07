import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/pages/conversation/section/view.conversationSection.dart';
import 'package:wrg2/fontend/pages/offers/view.offers.dart';
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
    return Container(
        // height: 320,
        padding: EdgeInsets.only(top: 30),
        alignment: Alignment.center,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Obx(
                  () => infoService.isSignedIn.value
                      ? Container(
                          margin: EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: ts.grey1),
                          child: CircleAvatar(
                            backgroundImage: Image.network(
                                    service.userInfo.value.userImageUrl)
                                .image,
                            radius: 20,
                          ),
                        )
                      : Container(
                          height: 40,
                          width: 40,
                          // margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: ts.grey1),
                          child: Icon(
                            CupertinoIcons.person_alt_circle,
                            color: ts.white,
                            size: 40,
                          ),
                        ),
                ),
              ),
              Obx(() => infoService.isSignedIn.value
                  ? Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        "Hello ${service.userInfo.value.username}",
                        textScaleFactor: 1,
                        style: TextStyle(color: ts.grey),
                      ),
                    )
                  : Text(
                      "",
                    ).huge()),
            ],
          ),
        ));
  }
}
