import 'package:flutter/material.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        child: CircularProgressIndicator(
          color: ts.red,
        ),
      ),
    );
  }
}
