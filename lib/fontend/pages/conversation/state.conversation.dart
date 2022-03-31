import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/messages.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.dialog.dart';
import 'package:wrg2/backend/services/service.information.dart';

class ConversationState extends GetxController with StateMixin {
  var infoServcie = Get.find<InformationService>();
  final service = Get.find<APIService>();

  var map = Map<String, ConversationModel>();
  var textControler = TextEditingController();
  final dialog = Get.find<DialogService>();
  final listViewController = ScrollController();
  final stream = StreamController<Map<String, dynamic>>();
  bool loading = false;
  String id;
  ConversationModel cm;
  List<MessagesModel> list = [];

  FocusNode fn = FocusNode();

  @override
  void onInit() {
    super.onInit();
    getMessages();
    initWebSockets();
  }

  void KeyboardStateChanged(bool showing) {
    print(showing);
    if (showing)
      Future.delayed(Duration(milliseconds: 250), () {
        listViewController
            .jumpTo(listViewController.position.maxScrollExtent + 250);
      });
  }

  void initWebSockets() async {
    await Future.delayed(Constants.duration);
    service.websocketOps.connect();
    stream.stream.listen((event) {
      print(event);
      updateListWithMessage(event);
    });
    service.websocketOps.createRoom(id, stream);
  }

  void updateListWithMessage(dynamic msg) async {
    MessagesModel model = MessagesModel.fromMap(msg);

    list.add(model);
    loading = false;
    refresh();
    await Future.delayed(Constants.durationShort);
    scrolltobottom();
  }

  @override
  void onClose() {
    super.onClose();
    service.websocketOps.leaveRoom(id);
  }

  void getMessages() async {
    try {
      infoServcie.setMessages([], id);
      await Future.delayed(Constants.duration);
      change(null, status: RxStatus.loading());
      var res = await service.getMessages(id);
      if (res != null) {
        list.addAll(res);
        change(null, status: RxStatus.success());
        await Future.delayed(Constants.durationShort);
        infoServcie.setMessages(list, id);
        scrolltobottom();
      }
      // change(null, status: RxStatus.empty());
    } catch (e) {
      print(e);
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void sendMessage(ConversationModel model) async {
    if (textControler.text != "") {
      loading = true;
      refresh();
      var msg = MessagesModel();
      msg.content = textControler.text;
      msg.sender = service.userInfo.value.userId;
      msg.createdAt = DateTime.now();
      msg.id = model.id;

      service.websocketOps.sendMessage(msg, id);
      // list.add(msg);
      refresh();
      // var ans = await service.addMessageToConversation(model, msg);
      // if (ans) {
      //   model.messages.add(msg);
      //   list.add(msg);

      //   loading = false;
      //   infoServcie.updateConversation(model);
      //   infoServcie.updateMessages(msg, model.id);
      //   scrolltobottom();
      //   refresh();
      // } else {
      //   loading = false;
      //   refresh();
      // }
      textControler.text = "";
      dialog.closeDialog();
    }
  }

  scrolltobottom() async {
    listViewController.animateTo(
        listViewController.position.maxScrollExtent + 100,
        duration: Constants.durationShort,
        curve: Curves.decelerate);

    // listViewController.jumpTo(listViewController.position.maxScrollExtent + 10);
  }

  void setId(String id) {
    this.id = id;
  }
}
