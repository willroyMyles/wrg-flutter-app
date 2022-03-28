import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/services/service.preferences.dart';
import 'package:wrg2/fontend/pages/view.homepage.dart';

class InfoScreenState extends GetxController {
  int idx = 0;
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 1);
  final prefs = Get.find<PreferenceService>();

  var imgs = [
    "assets/svg/post.png",
    "assets/svg/look.png",
    "assets/svg/relax.png",
  ];

  updateIndex(int val) {
    if (val > 2) Get.to(() => HomePageView());
    idx = val;
    refresh();
  }

  updatePage(int val) {
    controller.animateToPage(val,
        duration: Duration(milliseconds: 150), curve: Curves.easeInOutCubic);
    if (val > 2) {
      prefs.prefs.write(prefs.preferences.firstStart, true);
      Get.to(() => HomePageView());
    }
  }
}
