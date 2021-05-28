import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/fontend/pages/discover/view.discover.dart';
import 'package:wrg2/fontend/pages/personal/view.personal.dart';
import 'package:wrg2/fontend/pages/profile/view.profile.dart';

class HomePageState extends GetxController {
  PageController pc = PageController(initialPage: 0, keepPage: true);
  RxInt currentIndex = 0.obs;
  List<Widget> views = [Personal(), Discover(), ProfileView()];

  List<Widget> icons = [
    Icon(Icons.gps_fixed_rounded),
    Icon(Icons.all_inbox_sharp),
    Icon(Icons.face),
  ];

  onIndexTapped(int index) {
    pc.animateToPage(index,
        duration: Constants.duration, curve: Curves.easeInOutCubic);
    currentIndex.value = index;
    refresh();
  }

  void setCurrentIndex(int value) {
    currentIndex.value = value;
    refresh();
  }
}
