import 'package:flutter/material.dart';

class WRGAvatar extends StatelessWidget {
  final double size;
  final String imgSrc;

  const WRGAvatar({Key key, this.size = 30, this.imgSrc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7),
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          image: DecorationImage(
              image: Image.network(imgSrc).image, fit: BoxFit.cover)),
    );
  }
}
