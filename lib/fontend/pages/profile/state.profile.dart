import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.executor.dart';

class ProfileState extends GetxController with StateMixin {
  final api = Get.find<APIService>();
  TextEditingController textEditingController = TextEditingController();

  void sendMessage() {
    api.sendSlackMessage(textEditingController.text);
  }

  dynamic cal() {
    print("cal");
    return 5;
  }
}
