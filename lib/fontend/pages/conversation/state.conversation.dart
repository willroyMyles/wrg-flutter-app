import 'package:get/get.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/services/service.information.dart';

class ConversationState extends GetxController with StateMixin {
  var infoServcie = Get.find<InformationService>();
  var map = Map<String, ConversationModel>();

  @override
  void onInit() {
    super.onInit();
    change("", status: RxStatus.empty());
    configure();
  }

  void configure() {
    this.infoServcie.conversations.listen((convos) {
      map = Map<String, ConversationModel>.from(convos);
      if (map.isEmpty) return change("", status: RxStatus.empty());
      change("", status: RxStatus.success());
    });
  }
}
