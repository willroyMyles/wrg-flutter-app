import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/pages/login/view.login.dart';

class ProfileView extends StatelessWidget {
  final infoService = Get.find<InformationService>();
  final service = Get.find<APIService>();
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
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                    onPressed: () {
                      service.logout();
                    },
                    child: Text("already logged in\n tap to log out "))
                .primary()
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
