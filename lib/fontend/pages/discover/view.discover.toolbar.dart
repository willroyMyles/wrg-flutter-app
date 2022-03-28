import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/fontend/pages/discover/state.discover.dart';

class DiscoverToolBar extends StatelessWidget {
  DiscoverToolBar({Key key}) : super(key: key);

  final DiscoverState controller = Get.put(DiscoverState());

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      primary: false,
      automaticallyImplyLeading: false,
      title: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0),
              borderRadius: BorderRadius.circular(2)),
          height: 50,
          width: Get.width,
          // margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text("options",
                      style: TextStyle(
                          color: ts.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16))),
              Spacer(),
              Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Icon(CupertinoIcons.sort_down))
                  .glass(),
              InkWell(
                onTap: () {
                  controller.showBottomFilter();
                },
                child: Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Icon(
                            CupertinoIcons.square_stack_3d_down_right_fill))
                    .glass(),
              ),
            ],
          )),
    );
  }
}
