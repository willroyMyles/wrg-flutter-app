import 'package:flutter/material.dart';

extension ColorExtemsion on Color {
  Color darker() {
    var amount = 20;
    var r = this.red - amount;
    var g = this.green - amount;
    var b = this.blue - amount;
    var a = this.alpha;

    if (r < 0) r = 0;
    if (g < 0) g = 0;
    if (b < 0) b = 0;

    return Color.fromARGB(a, r, g, b);
  }

  Color lighter() {
    var amount = 40;
    var r = this.red + amount;
    var g = this.green + amount;
    var b = this.blue + amount;
    var a = this.alpha;

    if (r > 255) r = 255;
    if (g > 255) g = 255;
    if (b > 255) b = 255;

    return Color.fromARGB(a, r, g, b);
  }

  Color opposite() {
    var r = this.red;
    var g = this.green;
    var b = this.blue;
    var a = this.alpha;

    return Color.fromARGB(a, _opp(r), _opp(g), _opp(b));
  }

  int _opp(int val) {
    var v = val - 255;
    return v.abs();
  }
}
