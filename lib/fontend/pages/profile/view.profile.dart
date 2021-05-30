import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/fontend/pages/login/view.login.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          child: Text("login"),
          onPressed: () {
            Get.to(() => LoginView());
          },
        ),
      ),
    );
  }
}
