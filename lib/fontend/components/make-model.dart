import 'package:animated/animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/create/state.create.dart';

class MakeModelView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MakeList();
  }
}

class MakeList extends StatelessWidget {
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
                Texxt("Select Make").huge(),
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
                              Get.close(1);
                              Get.dialog(
                                  Container(
                                      height: 330,
                                      width: Get.width,
                                      alignment: Alignment.center,
                                      child: ModelList(
                                        idx: index,
                                        tag: tag,
                                      )),
                                  barrierColor: Colors.black.withOpacity(.4),
                                  useRootNavigator: false);
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
                                  child: Texxt(cs.carsList
                                          .elementAt(index)
                                          .elementAt(0))
                                      .hunch(),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 13,
                            ),
                        itemCount: cs.carsList.length)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ModelList extends StatelessWidget {
  final cs = Get.find<CreatePostState>();
  final ts = Get.find<ServiceTheme>();

  final String tag;
  final int idx;

  ModelList({Key key, this.tag, this.idx}) : super(key: key);

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
                Texxt("Select Model").huge(),
                SizedBox(
                  height: 12,
                ),
                Hero(
                  tag: tag,
                  child: Container(
                    child:
                        Texxt(cs.carsList.elementAt(idx).elementAt(0)).hunch(),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        itemBuilder: (context, index) {
                          var list = cs.carsList.elementAt(idx);
                          return InkWell(
                            onTap: () {
                              cs.setMakeAndModel(idx, index);
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
                              child: Texxt(list.elementAt(index).toString())
                                  .hunch(),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 13,
                            ),
                        itemCount: cs.carsList.elementAt(idx).length)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
