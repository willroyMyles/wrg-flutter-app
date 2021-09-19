import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/components/item.watching.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class WatchingListView extends StatelessWidget {
  final List<String> tags;
  final Animation<double> anim;
  WatchingListView({Key key, this.tags, this.anim}) : super(key: key);
  final InformationService informationService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedBuilder(
          animation: anim,
          builder: (context, child) {
            return ScaleTransition(
              scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: anim,
                  curve: Interval(0.6, 1, curve: Curves.easeInOutCubic))),
              child: child,
            );
          },
          child: FloatingActionButton(
            child: Icon(
              CupertinoIcons.arrow_left,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          )),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: anim,
            builder: (context, child) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: anim,
                    curve: Interval(0.5, 1, curve: Curves.easeInOutCubic))),
                child: child,
              );
            },
            child: Container(
              color: Colors.white,
            ),
          ),
          AnimatedBuilder(
            animation: anim,
            builder: (context, child) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: anim,
                    curve: Interval(0.6, 1, curve: Curves.easeInOutCubic))),
                child: child,
              );
            },
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.topCenter,
                width: Get.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text("Watching").h1(),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: anim,
            builder: (context, child) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: anim,
                    curve: Interval(0.3, 0.8, curve: Curves.easeInOutCubic))),
                child: child,
              );
            },
            // child: Container(
            //     child: Wrap(children: [
            //   ...informationService.watching.values.map((e) {
            //     var index =
            //         informationService.watching.values.toList().indexOf(e);
            //     return Hero(
            //       tag: tags.elementAt(index),
            //       child: Material(
            //         child: WatchingItem(
            //           element: e,
            //           // index: index,
            //         ),
            //       ),
            //     );
            //   }),
            // ])),

            child: GridView.builder(
              padding: EdgeInsets.only(top: 100, bottom: 60),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 180,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemCount: informationService.watching.values.length,
              itemBuilder: (context, index) {
                var element = informationService.watching.values
                    .toList()
                    .reversed
                    .elementAt(index);
                return Align(
                  child: Hero(
                    tag: tags.elementAt(index),
                    child: Container(
                      child: PreferredSize(
                        preferredSize: Size(20, 20),
                        child: WatchingItem(
                          element: element,
                          // index: index,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
