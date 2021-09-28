import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
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
      floatingActionButton: FloatingActionButton(
        heroTag: "fab",
        child: Icon(
          CupertinoIcons.arrow_left,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              width: Get.width,
              // color: Colors.white,
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
          GridView.builder(
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
        ],
      ),
    );
  }
}
