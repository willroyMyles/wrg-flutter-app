import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/fontend/pages/create/view.create.dart';
import 'package:wrg2/fontend/pages/discover/view.discover.dart';
import 'package:wrg2/fontend/pages/personal/view.personal.dart';
import 'package:wrg2/fontend/pages/profile/view.profile.dart';

class HomePageState extends GetxController {
  PageController pc = PageController(initialPage: 0, keepPage: true);
  RxInt currentIndex = 0.obs;
  var panelController = PanelController();
  Widget currentPanelWidget = Container();
  bool panelDraggable = false;

  List<Widget> views = [Personal(), Discover(), ProfileView()];

  List<Icon> icons = [
    Icon(Icons.gps_fixed_rounded),
    Icon(Icons.all_inbox_sharp),
    Icon(Icons.face),
  ];

  onIndexTapped(int index) {
    // if (index == 2) {
    //   setPanelWidget(views.elementAt(index));
    //   showPanel();
    //   return;
    // }
    pc.jumpToPage(
      index,
    );
    currentIndex.value = index;
    refresh();
  }

  void setCurrentIndex(int value) {
    currentIndex.value = value;
    refresh();
  }

  setPanelWidget(Widget widget) {
    currentPanelWidget = widget;
  }

  setDraggable(bool val) {
    panelDraggable = val;
    refresh();
  }

  showPanel() {
    panelController.show();
    panelController.animatePanelToPosition(1);
    panelDraggable = true;
    refresh();
  }

  onAddPost() {
    setPanelWidget(CreatePost());
    showPanel();
  }
}
