import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceTheme {
  var red = Color.fromRGBO(242, 84, 91, 1);
  var grey = Color.fromRGBO(118, 129, 142, 1);
  var blue = Color.fromRGBO(79, 124, 172, 1);
  var cornsilk = Color.fromRGBO(233, 233, 233, 1);

  var grey1 = Color.fromRGBO(70, 70, 70, 1);
  var grey2 = Color.fromRGBO(50, 50, 50, 1);
  var background = Color.fromRGBO(235, 235, 240, 1);
  var white = Color.fromRGBO(252, 252, 252, 1);

  ThemeData lightTheme;
  ThemeData currentTheme;

  ServiceTheme() {
    lightTheme = ThemeData.light().copyWith(
      brightness: Brightness.dark,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: background,
      backgroundColor: background,
      primaryColor: background,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.green,
      ),
      dialogBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
      accentColor: red,
      tabBarTheme: TabBarTheme(
        labelColor: grey1,
        unselectedLabelColor: grey,
        labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            shadows: [
              Shadow(blurRadius: 18, color: Colors.black.withOpacity(.2))
            ],
            fontSize: 30),
        unselectedLabelStyle: TextStyle(
            color: Colors.grey.shade200,
            fontWeight: FontWeight.w500,
            fontSize: 16),
        indicator: UnderlineTabIndicator(
          borderSide:
              BorderSide(width: 3, color: grey1, style: BorderStyle.solid),
          insets: EdgeInsets.symmetric(horizontal: 80),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: grey1,
          elevation: 5,
          focusElevation: 10,
          disabledElevation: 1),
      iconTheme: IconThemeData(
        color: Colors.grey.shade700,
        size: 28,
        opacity: .8,
      ),
      primaryIconTheme: IconThemeData(
        color: Colors.grey.shade700,
        size: 28,
        opacity: .8,
      ),
      accentIconTheme: IconThemeData(
        color: Colors.grey.shade700,
        size: 28,
        opacity: .8,
      ),
    );

    currentTheme = lightTheme;

    gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          grey1,
          grey2,
        ],
        stops: [
          0,
          1
        ]);
  }

  LinearGradient gradient;
  LinearGradient fin = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.blue.shade100.withOpacity(.5),
        Colors.blue.shade100.withOpacity(.5),
        Colors.blue.shade900,
      ],
      stops: [
        0,
        .65,
        1
      ]);
}
