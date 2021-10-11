import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:wrg2/backend/extensions/text.extension.dart';
import 'package:wrg2/backend/services/service.constants.dart';

class TouchUp extends StatefulWidget {
  final Widget child;
  const TouchUp({Key key, this.child}) : super(key: key);

  @override
  _TouchUpState createState() => _TouchUpState();
}

class _TouchUpState extends State<TouchUp> {
  bool isTouching = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.translucent,

      onTapDown: (tdd) {
        setState(() {
          isTouching = true;
        });
      },
      onTapUp: (tdd) {
        setState(() {
          isTouching = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isTouching = false;
        });
      },
      child: AnimatedContainer(
        duration: Constants.durationShort * .5,
        margin: EdgeInsets.symmetric(vertical: isTouching ? 20 : 0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: isTouching ? 30 : 0,
              color: ts.grey.withOpacity(isTouching ? .1 : .0))
        ]),
        child: widget.child,
      ),
    );
  }
}
