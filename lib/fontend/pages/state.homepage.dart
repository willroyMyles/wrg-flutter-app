import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.toast.dart';
import 'package:wrg2/fontend/pages/create/view.create.dart';
import 'package:wrg2/fontend/pages/discover/view.discover.dart';
import 'package:wrg2/fontend/pages/personal/view.personal.dart';
import 'package:wrg2/fontend/pages/profile/view.profile.dart';
import 'package:get/get.dart';

class HomePageState extends GetxController with SingleGetTickerProviderMixin {
  PageController pc = PageController(initialPage: 0, keepPage: true);
  RxInt currentIndex = 0.obs;
  Widget currentPanelWidget = Container();
  final infoService = Get.find<InformationService>();

  TabController tabController;
  AnimationController animationController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool panelDraggable = false;

  List<Widget> views = [Personal(), Discover()];

  List<Icon> icons = [
    Icon(Icons.gps_fixed_rounded),
    Icon(Icons.all_inbox_sharp),
    Icon(Icons.face),
  ];

  onIndexTapped(int index) {
    pc.animateToPage(index,
        duration: Duration(milliseconds: 120), curve: Curves.easeInOutCubic);

    setCurrentIndex(index);
    refresh();
  }

  void setCurrentIndex(int value) {
    currentIndex.value = value;
    // infoService.updateFab(value == 1);
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
    // panelController.show();
    // panelController.animatePanelToPosition(1);
    panelDraggable = true;
    refresh();
  }

  onAddPost() {
    // setPanelWidget(CreatePost());
    // showPanel();
    showBottomSheet(
      context: Get.context,
      builder: (context) => CreatePost(),
    );
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: views.length, vsync: this);
    animationController = AnimationController(vsync: this);
  }

  void updateTabs(int value) {
    tabController.animateTo(value);
    setCurrentIndex(value);
  }
}
