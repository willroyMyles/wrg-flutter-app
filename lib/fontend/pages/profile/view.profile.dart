import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/feedback/view.feedback.dart';
import 'package:wrg2/fontend/pages/login/view.login.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wrg2/fontend/pages/profile/state.profile.dart';

class ProfileView extends StatelessWidget {
  final infoService = Get.find<InformationService>();
  final service = Get.find<APIService>();
  final ts = Get.find<ServiceTheme>();
  final controller = Get.put(ProfileState());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: infoService.isSignedIn.stream,
        builder: (context, snapshot) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                if (infoService.isSignedIn.value)
                  SliverAppBar(
                    title: Row(
                      children: [
                        Text("hello ").h3(),
                        Text(service.userInfo.value.username).h2(),
                      ],
                    ),
                  ),
                SliverPadding(padding: EdgeInsets.all(100)),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: FlatButton(
                            onPressed: () {
                              if (infoService.isSignedIn.value)
                                service.logout();
                              else
                                Get.to(() => LoginView());
                            },
                            child: Text(infoService.isSignedIn.value
                                ? "already logged in\n tap to log out "
                                : "tap to login"))
                        .primary(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: FlatButton(
                            onPressed: () {
                              Get.dialog(
                                  Dialog(
                                    child: SingleChildScrollView(
                                        child: FeedbackView()),
                                    backgroundColor:
                                        Colors.white.withOpacity(.2),
                                    insetPadding: EdgeInsets.all(15),
                                  ),

                                  // KeyboardVisibilityBuilder(
                                  //   builder: (context, v) => AnimatedContainer(
                                  //     duration: Duration(milliseconds: 350),
                                  //     padding: EdgeInsets.only(top: 10),
                                  //     alignment: v
                                  //         ? Alignment.topCenter
                                  //         : Alignment.center,
                                  //     child: FeedbackView(),
                                  //   ),
                                  // ),
                                  // barrierColor: Colors.red,
                                  barrierDismissible: true,
                                  useSafeArea: true);
                            },
                            child: Text("leave feedback"))
                        .secondary(),
                  ),
                )
              ],
            ),
          );

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
