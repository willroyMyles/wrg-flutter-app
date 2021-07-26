import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.dialog.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/view.homepage.dart';
import './backend/extensions/ext.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ServiceTheme ts;
  Widget home;

  Future<bool> configure() async {
    await Firebase.initializeApp();
    ts = Get.put(ServiceTheme());
    Get.put(APIService());
    home = GetMaterialApp(
        title: 'Flutter Demo',
        theme: ts.currentTheme.value,
        home: Container(
          child: HomePageView(),
          decoration: BoxDecoration(gradient: ts.gradient.value),
        ));

    return Future.value(true);
  }

  Future<bool> api;

  @override
  void initState() {
    super.initState();
    Get.put(DialogService());

    setState(() {
      api = configure();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GetMaterialApp(
            home: Container(
              alignment: Alignment.center,
              child: Text(
                "loading",
                textScaleFactor: 2,
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return home;
        }

        return Container();
      },
    );
  }
}
