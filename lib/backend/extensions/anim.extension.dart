import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:wrg2/backend/services/service.constants.dart';

extension AnimExt on Widget {
  Widget fadeInDown({double multiplier = .1}) {
    return FadeInDown(
      child: this,
      duration: Constants.duration,
      delay: Constants.durationShort * multiplier,
    );
  }

  Widget fadeInUp({multiplier = .1}) {
    return FadeInUp(
      from: 100,
      child: this,
      duration: Constants.duration,
      delay: Constants.durationShort * multiplier,
    );
  }

  Widget elasticIn({multiplier = .1}) {
    return ElasticIn(
      // from: 100,

      child: this,
      duration: Constants.durationLong * .8,
      delay: Constants.durationShort * multiplier,
    );
  }
}
