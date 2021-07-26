import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/create/state.create.dart';

class CatSubView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CatList();
  }
}

class CatList extends StatelessWidget {
  final cs = Get.find<CreatePostState>();
  final ts = Get.find<ServiceTheme>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Container(
            width: Get.width - 30,
            height: Get.height / 2,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: ts.bg.value,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(width: 1, color: ts.bg.value.darker()),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 14,
                      color: ts.fgt.value.withOpacity(.3),
                      offset: Offset(1, 3))
                ]),
            child: Column(
              children: [
                Text("Select category").huge(),
                SizedBox(
                  height: 12,
                ),
                Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        itemBuilder: (context, index) {
                          String tag = "$index tag";
                          return InkWell(
                            onTap: () {
                              cs.setCategory(index);
                              Get.close(1);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 12),
                              decoration: BoxDecoration(
                                  color: ts.fg.value,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      width: 1, color: ts.bg.value.darker()),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        color: ts.fgt.value.withOpacity(.05),
                                        offset: Offset(1, 3))
                                  ]),
                              child: Hero(
                                tag: tag,
                                child: Container(
                                  child: Text(cs.sub_catList
                                          .elementAt(index)
                                          .toString())
                                      .hunch(),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 13,
                            ),
                        itemCount: cs.sub_catList.length)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
