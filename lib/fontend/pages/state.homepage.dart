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
  final scaffoldKey = GlobalObjectKey<ScaffoldState>("scaffold");
  final scrollController = ScrollController();
  bool showArrow = false;

  bool panelDraggable = false;

  List<Widget> views = [Personal(), Discover()];

  List<Icon> icons = [
    Icon(Icons.gps_fixed_rounded),
    Icon(Icons.all_inbox_sharp),
    Icon(Icons.face),
  ];

  animateToTop() {
    scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 250), curve: Curves.easeIn);
  }

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
    Future.delayed(Duration(milliseconds: 250), () {
      scrollController.position.isScrollingNotifier.addListener(() {
        if (scrollController.positions.first.pixels > 20) {
          print("off");
          if (!showArrow) {
            showArrow = true;
            refresh();
          }
        } else {
          if (showArrow) {
            showArrow = false;
            refresh();
          }
        }
      });
    });
  }

  void updateTabs(int value) {
    tabController.animateTo(value);
    setCurrentIndex(value);
  }
}
