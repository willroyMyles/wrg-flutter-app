import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.dialog.dart';
import 'package:wrg2/backend/services/service.preferences.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/intro/introScreen.dart';
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
  PreferenceService pref;

  Future<bool> configure() async {
    if (!Platform.isWindows) await Firebase.initializeApp();
    pref = Get.put(PreferenceService());
    await pref.configure();
    Get.put(DialogService());
    ts = Get.put(ServiceTheme());
    Get.put(APIService());
    setState(() {
      building = false;
    });

    Get.config(enableLog: false, defaultTransition: Transition.fadeIn);

    // Get.config(defaultTransition: Transition.fadeIn);
    // Get.changeThemeMode(ThemeMode.dark);

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
          return Builder(builder: (context) {
            bool firstStart = pref.getPref(pref.preferences.firstStart);

            return GetMaterialApp(
                title: 'Flutter Demo',
                theme: ts.currentTheme,
                // defaultTransition: Transition.,
                home: Container(
                  // child: HomePageView(),
                  child: !firstStart ? IntroScreen() : HomePageView(),
                  decoration: BoxDecoration(gradient: ts.gradient),
                ));
          });
      },
    );
  }
}
