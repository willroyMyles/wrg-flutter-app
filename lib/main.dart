import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  bool building = true;

  Future<bool> configure() async {
    await Firebase.initializeApp();
    Get.put(DialogService());
    ts = Get.put(ServiceTheme());
    Get.put(APIService());
    setState(() {
      building = false;
    });
    return Future.value(true);
  }

  Future<bool> api;

  @override
  void initState() {
    super.initState();

    configure();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (building)
          return MaterialApp(
            home: Scaffold(
              body: Container(
                alignment: Alignment.center,
                child: Text(
                  "loading",
                  textScaleFactor: 2,
                ),
              ),
            ),
          );
        else
          return GetMaterialApp(
              title: 'Flutter Demo',
              theme: ts.currentTheme,
              home: Container(
                child: HomePageView(),
                decoration: BoxDecoration(gradient: ts.gradient),
              ));
      },
    );
  }
}
