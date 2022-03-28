import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:wrg2/backend/extensions/text.extension.dart';
import 'package:wrg2/backend/services/service.constants.dart' hide ts;

class LoadingButton extends StatelessWidget {
  final IconData icon;
  final bool loading;
  final Function callback;
  LoadingButton({Key key, this.icon, this.loading, this.callback})
      : super(key: key);

  final double size = 50;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Container(
        height: size,
        width: size,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: ts.grey1,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  color: ts.grey.withOpacity(.7),
                  offset: Offset(3, 5))
            ]),
        child: AnimatedSwitcher(
          child: loading ? buildLoading() : buildIcon(),
          duration: Constants.duration,
          reverseDuration: Constants.durationShort,
          switchInCurve: Interval(0, 1, curve: Curves.linear),
          switchOutCurve: Interval(0, 1, curve: Curves.linear),
          transitionBuilder: (child, animation) {
            return ElasticIn(child: child);
          },
        ),
      ),
    );
  }

  Widget buildIcon() => Icon(
        icon,
        key: ValueKey("icon"),
        color: ts.white,
      );
  Widget buildLoading() {
    return Container(
      padding: EdgeInsets.all(5),
      child: CircularProgressIndicator(
        key: ValueKey("not icon"),
        color: ts.red,
        strokeWidth: 3,
      ),
    );
  }
}
