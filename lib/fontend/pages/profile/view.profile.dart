import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/login/view.login.dart';

class ProfileView extends StatelessWidget {
  final infoService = Get.find<InformationService>();
  final service = Get.find<APIService>();
  final ts = Get.find<ServiceTheme>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: infoService.isSignedIn.stream,
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          print(snapshot.data);
          return Scaffold(
            body: infoService.isSignedIn.value ? buildTrue() : buildFalse(),
          ).background();
        });
  }

  Widget buildTrue() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 45),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      service.userInfo.value.username
                          .split(" ")
                          .first
                          .toString(),
                    ).humungous(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 1),
                    child: Text(service.userInfo.value.username
                            .split(" ")
                            .last
                            .toString())
                        .humungousThin(),
                  )
                ],
              ),
            ),
            FlatButton(
                    onPressed: () {
                      service.logout();
                    },
                    child: Text("already logged in\n tap to log out "))
                .primary(),
            SizedBox()
          ],
        ));
  }

  Widget buildFalse() {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        child: Text("tap to login"),
        onPressed: () {
          Get.to(() => LoginView());
        },
      ).primary(),
    );
  }
}
