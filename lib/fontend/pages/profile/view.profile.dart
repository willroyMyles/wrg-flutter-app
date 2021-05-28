import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("building profile");
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          child: Text("login"),
          onPressed: () {},
        ),
      ),
    );
  }
}
