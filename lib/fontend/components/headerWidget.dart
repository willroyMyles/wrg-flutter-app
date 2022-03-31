import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatelessWidget {
  final String text;
  final String tag;
  HeaderWidget(this.text, {Key key, this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        padding: EdgeInsets.only(left: 9),
        alignment: Alignment.centerLeft,
        child: Text(
          text.capitalize,
          style: TextStyle(fontSize: 35),
        ),
      ),
      if (tag != null)
        Container(
          padding: EdgeInsets.only(left: 9),
          alignment: Alignment.centerLeft,
          child: Text(
            tag.capitalize,
            style: TextStyle(fontSize: 16),
          ),
        ),
      SizedBox(
        height: 15,
      )
    ]));
  }
}
