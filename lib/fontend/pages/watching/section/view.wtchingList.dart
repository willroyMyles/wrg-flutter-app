import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/components/item.post.dart';
import 'package:wrg2/fontend/components/item.watching.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class WatchingListView extends StatelessWidget {
  WatchingListView({Key key}) : super(key: key);
  final InformationService informationService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watching"),
        backgroundColor: ts.grey1,
      ),
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
          GridView.builder(
            padding: EdgeInsets.only(top: 10, bottom: 60),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 180,
                crossAxisCount: 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemCount: informationService.watching.values.length,
            itemBuilder: (context, index) {
              var element = informationService.watching.values
                  .toList()
                  .reversed
                  .elementAt(index);
              return Align(
                child: Container(
                  child: PreferredSize(
                    preferredSize: Size(20, 20),
                    child: PostItem(
                      item: element,
                      // index: index,
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
