import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.dialog.dart';
import 'package:wrg2/backend/services/service.information.dart';

class Crazy {
  var info = Get.find<InformationService>();
  var dia = Get.find<DialogService>();

  void loginguard(String action, Function callback) {
    if (!info.isSignedIn.value) {
      dia.showInfo(msg: "you need to be signed in to $action");
    } else {
      return callback();
    }
  }
}

Crazy crazy1 = Crazy();
Crazy get crazy => crazy1;
