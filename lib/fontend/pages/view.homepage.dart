import 'package:animated/animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/create/view.create.dart';
import 'package:wrg2/fontend/pages/state.homepage.dart';

class HomePageView extends StatelessWidget {
  final state = Get.put(HomePageState());
  final ts = Get.find<ServiceTheme>();
  final double padding = 20.0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageState>(builder: (state) {
      return SlidingUpPanel(
        controller: state.panelController,
        minHeight: 70,
        maxHeight: Get.height - 200,
        boxShadow: [BoxShadow(blurRadius: 0, color: Colors.grey)],
        backdropEnabled: true,
        parallaxEnabled: true,
        backdropOpacity: .3,
        backdropColor: Colors.black,
        isDraggable: state.panelDraggable,
        panel: state.currentPanelWidget,
        onPanelClosed: () {
          state.setDraggable(false);
        },
        collapsed: Container(
          width: Get.width,
          color: ts.bg.value,
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...state.icons.map((e) {
                var index = state.icons.indexOf(e);
                var isSelected = state.currentIndex.value == index;
                return Material(
                  // color: Colors.white,
                  // borderRadius: BorderRadius.circular(100),
                  // elevation: 0,
                  child: GestureDetector(
                    onTap: () {
                      state.onIndexTapped(index);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            clipBehavior: Clip.antiAlias,
                            child: Animated(
                              duration: Duration(milliseconds: 200),
                              value: isSelected ? 1.5 : 1,
                              builder: (context, child, animation) {
                                return Transform.translate(
                                  offset:
                                      Offset(0, -((animation.value - 1) * 15)),
                                  child: Transform.scale(
                                      scale: animation.value, child: child),
                                );
                              },
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 200),
                                opacity: isSelected ? 1 : .5,
                                child: AnimatedSwitcher(
                                  child: isSelected && index == 1
                                      ? Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 7,
                                                    color: Colors.grey.shade100,
                                                    offset: Offset(0, 3))
                                              ]),
                                          child: InkWell(
                                            onTap: () {
                                              // state.onAddPost();
                                              Get.to(() => CreatePost());
                                            },
                                            child: Icon(
                                              Icons.add_circle,
                                              color: ts.pc,
                                              key: Key("icon"),
                                            ),
                                          ),
                                        )
                                      : Icon(e.icon,
                                          color:
                                              isSelected ? ts.pc : Colors.grey),
                                  transitionBuilder: (child, animation) =>
                                      FadeTransition(
                                    opacity: animation,
                                    child: ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 200),
                                ),
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              // color: isSelected
                              //     ? Colors.blue.shade100
                              //     : Colors.white,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 200),
                            bottom: isSelected ? 10 : -30,
                            left: padding,
                            child: AnimatedContainer(
                                // width: Get.width / state.icons.length,
                                alignment: Alignment.bottomCenter,
                                height: 60,
                                child: Container(
                                  height: 7,
                                  width: 7,
                                  decoration: BoxDecoration(
                                      color: ts.pc,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(blurRadius: 10, color: ts.pc)
                                      ]),
                                ),
                                duration: Duration(milliseconds: 200)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 65),
              child: PageView.builder(
                controller: state.pc,
                itemCount: state.views.length,
                onPageChanged: (value) {
                  state.setCurrentIndex(value);
                },
                itemBuilder: (context, index) {
                  return state.views.elementAt(index);
                },
              ),
            ),

            // AnimatedPositioned(
            //     bottom: 0,
            //     child: Container(
            //       width: Get.width,
            //       child: Container(
            //         height: 60,
            //         margin: EdgeInsets.symmetric(horizontal: 34, vertical: 4),
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(100)),
            //       ),
            //     ),
            //     duration: Constants.duration)
          ],
        ),
      );
    });
  }
}
