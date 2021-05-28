import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/fontend/pages/state.homepage.dart';

class HomePageView extends StatelessWidget {
  final state = Get.put(HomePageState());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 0),
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
        AnimatedPositioned(
            bottom: 0,
            child: Container(
              width: Get.width,
              child: Container(
                child: GetBuilder<HomePageState>(
                    init: state,
                    builder: (state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...state.icons.map((e) {
                            var index = state.icons.indexOf(e);
                            var isSelected = state.currentIndex.value == index;
                            return Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              elevation: 1,
                              child: InkWell(
                                onTap: () {
                                  state.onIndexTapped(index);
                                },
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  child: e,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: isSelected
                                        ? Colors.blue.shade100
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            );
                          })
                        ],
                      );
                    }),
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 34, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            duration: Constants.duration)
      ],
    );
  }
}
