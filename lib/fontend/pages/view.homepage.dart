import 'package:animated/animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/create/view.create.dart';
import 'package:wrg2/fontend/pages/state.homepage.dart';

class HomePageView extends StatelessWidget {
  final controller = Get.put(HomePageState());
  final ts = Get.find<ServiceTheme>();
  final infoService = Get.find<InformationService>();
  final service = Get.find<APIService>();
  final double padding = 20.0;
  final col = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetMaterialApp(
          key: ValueKey("get"),
          theme: ts.currentTheme.value,
          home: Scaffold(
            appBar: AppBar(
              // title: Text("WRG Auto"),
              toolbarHeight: 50,
              bottom: PreferredSize(
                preferredSize: Size(Get.width, 80),
                child: TabBar(
                  isScrollable: true,
                  controller: controller.tabController,
                  onTap: (value) {
                    controller.onIndexTapped(value);
                  },
                  // indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black.withOpacity(.7),
                  unselectedLabelColor: Colors.black.withOpacity(.5),
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      shadows: [
                        Shadow(
                            blurRadius: 18, color: Colors.black.withOpacity(.2))
                      ],
                      fontSize: 30),
                  unselectedLabelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),

                  // indicatorWeight: 5,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey.withOpacity(.9),
                        style: BorderStyle.solid),
                    insets: EdgeInsets.symmetric(horizontal: 30),
                  ),

                  tabs: [
                    Tab(
                      text: "Personal",
                      // icon: Icon(Icons.gps_fixed_rounded),
                    ),
                    Tab(
                      text: "Discover",
                      // icon: Icon(Icons.all_inbox_sharp),
                    ),
                    Tab(
                      text: "Account",
                      // icon: Icon(Icons.disc_full),
                    ),
                  ],
                ),
              ),
            ),
            body: PageView(
              onPageChanged: (value) {
                controller.updateTabs(value);
              },
              controller: controller.pc,
              // physics: AlwaysScrollableScrollPhysics(),
              children: [...controller.views],
            ),
          ),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: Duration(milliseconds: 250),
            bottom: controller.currentIndex.value == 1 ? 30 : -50,
            right: 20,
            child: Material(
              child: InkWell(
                onTap: () {
                  Get.to(() => CreatePost());
                },
                child: AnimatedContainer(
                  height: controller.currentIndex.value == 1 ? 50 : 0,
                  width: 50,
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                      color: col,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            color: col.withOpacity(.6),
                            offset: Offset(2, 4))
                      ]),
                  child: Icon(
                    Icons.add,
                    size: 33,
                    color: ts.fg.value,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
