import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.dialog.dart';
import 'package:wrg2/backend/services/service.information.dart';

class CommentState extends GetxController with StateMixin {
  final infoService = Get.find<InformationService>();
  final dialogService = Get.find<DialogService>();
  final apis = Get.find<APIService>();
  Map<String, CommentModel> map = {};
  double topPadding = 40;
  TextEditingController textEditingController = TextEditingController();
  bool ableToFetch = true;
  bool hideInput = false;
  FocusNode fn = FocusNode();
  KeyboardVisibilityNotification kbnf = KeyboardVisibilityNotification();
  int id = 0;

  @override
  void dispose() {
    super.dispose();
    kbnf.removeListener(id);
    kbnf.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    kbnf.removeListener(id);
    kbnf.dispose();
  }

  @override
  // TODO: implement onDelete
  get onDelete => super.onDelete;

  @override
  void onInit() {
    super.onInit();
  }

  void configure(String postId) async {
    if (!ableToFetch) return;

    id = kbnf.addNewListener(onChange: (bool visible) {
      hideInput = visible;
      change("");
      refresh();
      print(visible);
    });

    change("", status: RxStatus.loading());

    try {
      var res = await apis.getComments(postId);

      for (var item in res) {
        map.putIfAbsent(item.id, () => item);
      }
      change("", status: RxStatus.success());
    } catch (e) {
      change("", status: RxStatus.error("could not get comments"));
    }
  }

  updatePadding(double val) {
    print("called");
    change(null);
  }

  updateSelected(int index, bool isSelected) {}

  void setCanFetch(bool val) {
    ableToFetch = val;
  }

  void setEmpty() {
    change("", status: RxStatus.empty());
  }

  void onInputPressed(BuildContext context, Widget widget) async {
    hideInput = true;
    change("");
    await dialogService
        .showDialog(Hero(tag: "TextEditingchild", child: widget));
    hideInput = false;
    change("h");
  }
}
