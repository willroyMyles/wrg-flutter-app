import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.toast.dart';

class LoginState extends GetxController {
  final infoService = Get.find<InformationService>();
  final toastService = Get.find<ToastService>();
  @override
  void onInit() {
    super.onInit();
    configure();
  }

  void configure() {
    infoService.isSignedIn.listen((isSIgnedIn) {
      if (isSIgnedIn) {
        Get.back();
      }
    });
  }
}
