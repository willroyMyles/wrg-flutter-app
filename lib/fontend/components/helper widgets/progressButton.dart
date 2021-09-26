import 'package:progress_state_button/progress_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PBM {
  ButtonState buttonState = ButtonState.idle;

  var stateColors = {
    ButtonState.loading: Colors.amber,
    ButtonState.fail: Colors.red,
    ButtonState.idle: Colors.black,
    ButtonState.success: Colors.green,
  };

  setButtonStateIdle() {
    buttonState = ButtonState.idle;
  }

  setButtonStateLoading() {
    buttonState = ButtonState.loading;
  }

  setButtonStateFailed({VoidCallback callback}) async {
    buttonState = ButtonState.fail;
    if (callback != null) callback();
    Future.delayed(Duration(milliseconds: 3000), () {
      setButtonStateIdle();
      if (callback != null) callback();
    });
  }

  setButtonStateSuccess({VoidCallback callback}) async {
    buttonState = ButtonState.success;
    if (callback != null) callback();
    Future.delayed(Duration(milliseconds: 3000), () {
      setButtonStateIdle();
      if (callback != null) callback();
    });
  }
}
