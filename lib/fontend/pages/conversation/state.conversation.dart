import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/messages.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.dialog.dart';
import 'package:wrg2/backend/services/service.information.dart';

class ConversationState extends GetxController with StateMixin {
  var infoServcie = Get.find<InformationService>();
  final service = Get.find<APIService>();

  var map = Map<String, ConversationModel>();
  var panelController = PanelController();
  var textControler = TextEditingController();
  final dialog = Get.find<DialogService>();

  FocusNode fn = FocusNode();

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
      refresh();
    });
  }

  void sendMessage(ConversationModel model) {
    if (textControler.text != "") {
      var msg = MessagesModel();
      msg.content = textControler.text;
      msg.sender = service.userInfo.value.id;
      model.messages.add(msg);
      service.addMessageToConversation(model);
      textControler.text = "";
      dialog.closeDialog();
    }
  }
}
