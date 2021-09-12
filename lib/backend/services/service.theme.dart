import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceTheme {
  var lightTheme = ThemeData.light().copyWith(
      brightness: Brightness.light,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      primaryColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightF,
          elevation: 5,
          focusElevation: 10,
          foregroundColor: darkT,
          disabledElevation: 1),
      iconTheme: IconThemeData(color: lightT, size: 28, opacity: .9),
      primaryIconTheme: IconThemeData(color: lightT, size: 28, opacity: .9),
      accentIconTheme: IconThemeData(color: lightT, size: 28, opacity: .9));
  var darkTheme = ThemeData.light().copyWith(
      brightness: Brightness.dark,
      canvasColor: dark,
      scaffoldBackgroundColor: dark,
      backgroundColor: dark,
      primaryColor: Colors.black);
  Rx<ThemeData> currentTheme;

  Rx<LinearGradient> gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(255, 255, 255, 1),
        Color.fromRGBO(205, 205, 205, 1),
      ]).obs;

  Rx<LinearGradient> smallGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(255, 255, 255, 1),
        Color.fromRGBO(235, 235, 235, 1),
      ]).obs;

  ServiceTheme() {
    currentTheme = lightTheme.obs;
  }

  Rx<Color> get fg => lightF.obs;
  Rx<Color> get bg => light.obs;
  Rx<Color> get fgt => lightT.obs;
  Rx<Color> get fgbtn => lightT.obs;
  Rx<Color> get fgbtnt => darkTextAbs.obs;
  MaterialColor get pc => Colors.green;
}

var dark = Color.fromRGBO(24, 24, 24, 1);
var light = Color.fromRGBO(244, 244, 244, 1);
var darkF = Color.fromRGBO(64, 64, 64, 1);
var lightF = Color.fromRGBO(255, 255, 255, 1);

var lightT = Color.fromRGBO(24, 24, 24, 1);
var darkT = Color.fromRGBO(224, 224, 224, 1);
var lightTextAbs = Color.fromRGBO(0, 0, 0, 1);
var darkTextAbs = Color.fromRGBO(255, 255, 255, 1);
