import 'dart:ui';

import 'package:flutter/material.dart';

class Guassian extends StatelessWidget {
  final Widget child;
  final double br;
  final Size size;
  const Guassian(
      {Key key, this.child, this.br = 0.0, this.size = const Size(0, 0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(br),
      child: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
          ),
          Opacity(
            opacity: 1,
            child: child,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(.3)),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
