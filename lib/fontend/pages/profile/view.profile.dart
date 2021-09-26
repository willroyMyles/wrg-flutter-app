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

  var navKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Get.mediaQuery.viewPadding.top + 10, left: 8, bottom: 120),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: StreamBuilder<Object>(
          stream: infoService.isSignedIn.stream,
          builder: (context, snapshot) {
            var child =
                infoService.isSignedIn.value ? buildTrue() : buildFalse();

            return MaterialApp(
              navigatorKey: navKey,
              theme: ts.currentTheme,
              home: Material(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 350),
                  child: child,
                ),
              ),
            );
          }),
    );
  }

  Widget buildTrue() {
    return Container(
      // color: Colors.red,
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 190,
                    width: double.infinity,
                    decoration: BoxDecoration(color: ts.grey1, boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: ts.grey.withOpacity(.3),
                          offset: Offset(-140, 3)),
                      BoxShadow(
                          blurRadius: 30,
                          spreadRadius: 10,
                          color: ts.grey.withOpacity(.3),
                          offset: Offset(150, 13)),
                    ]),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                                onPressed: () {
                                  service.logout();
                                },
                                child: Text("log out "))
                            .secondary(),
                        SizedBox(
                          width: 20,
                        ),
                        FlatButton(
                                onPressed: () {
                                  Navigator.of(navKey.currentContext)
                                      .push(MaterialPageRoute(
                                    builder: (context) {
                                      return FeedbackView();
                                    },
                                  ));
                                },
                                child: Text("feedback"))
                            .secondary(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  Widget buildFalse() {
    return Container(
      key: ValueKey("false"),
      alignment: Alignment.center,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                    onPressed: () {
                      Navigator.of(navKey.currentContext)
                          .push(MaterialPageRoute(
                        builder: (context) {
                          return LoginView();
                        },
                      ));
                    },
                    child: Text("log in"))
                .secondary(),
            SizedBox(
              width: 20,
            ),
            FlatButton(
                    onPressed: () {
                      Navigator.of(navKey.currentContext)
                          .push(MaterialPageRoute(
                        builder: (context) {
                          return FeedbackView();
                        },
                      ));

                      return;
                      Get.dialog(
                          Dialog(
                            child: SingleChildScrollView(child: FeedbackView()),
                            backgroundColor: Colors.white.withOpacity(.2),
                            insetPadding: EdgeInsets.all(15),
                          ),
                          barrierDismissible: true,
                          useSafeArea: true);
                    },
                    child: Text("feedback"))
                .secondary(),
          ],
        ),
      ),
    );
  }
}
