import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/login/login.state.dart';

class LoginView extends StatelessWidget {
  final service = Get.find<APIService>();
  final controller = Get.put(LoginState());
  var ts = Get.find<ServiceTheme>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        // backgroundColor: ts.bg.value,
        iconTheme: IconThemeData(color: Colors.black, size: 20),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                      "For your enhanced security, we only allow login via third party Authorization",
                      textAlign: TextAlign.center)
                  .h2(),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset(
                      "assets/images/google.png",
                      fit: BoxFit.cover,
                    ),
                    onPressed: () {
                      service.login(0);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
