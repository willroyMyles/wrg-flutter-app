import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/pages/create/state.create.dart';

class MakeModelView extends StatelessWidget {
  const MakeModelView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MakeList();
  }
}

class MakeList extends StatelessWidget {
  final ValueSetter callback;
  MakeList({Key key, this.callback, this.scroll}) : super(key: key);

  final cs = Get.find<CreatePostState>();
  final ts = Get.find<ServiceTheme>();
  final scroll;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ts.white,
      child: CustomScrollView(
        controller: scroll,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Text("select make"),
            centerTitle: false,
            backgroundColor: ts.grey1,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Wrap(
                children: [
                  ...cs.carsList.map((e) {
                    return InkWell(
                      onTap: () {
                        var idx = cs.carsList.indexOf(e);
                        cs.setMake(idx);
                        Get.back();
                      },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ts.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 2, color: ts.grey),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: ts.grey.withOpacity(.13))
                            ]),
                        padding:
                            EdgeInsets.symmetric(horizontal: 33, vertical: 10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e.elementAt(0),
                              style: TextStyle(
                                  color: ts.grey1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
    return DraggableScrollableSheet(
      initialChildSize: .8,
      minChildSize: .4,
      maxChildSize: .8,
      builder: (context, scrollController) => Container(
        alignment: Alignment.center,
        child: Scaffold(
            body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
          color: Colors.white,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 12),
              controller: scrollController,
              itemBuilder: (context, index) {
                String tag = "$index tag";
                return InkWell(
                  onTap: () {
                    cs.setMake(index);
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    decoration: BoxDecoration(
                        // color: ts.fg.value,
                        borderRadius: BorderRadius.circular(4),
                        // border:
                        // Border.all(width: 1, color: ts.bg.value.darker()),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              // color: ts.fgt.value.withOpacity(.05),
                              offset: Offset(1, 3))
                        ]),
                    child: Hero(
                      tag: tag,
                      child: Container(
                        child: Text(cs.carsList.elementAt(index).elementAt(0))
                            .hunch(),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 13,
                  ),
              itemCount: cs.carsList.length),
        )),
      ),
    );
  }
}

class ModelList extends StatelessWidget {
  final ValueSetter callback;

  final cs = Get.find<CreatePostState>();
  final ts = Get.find<ServiceTheme>();

  final String tag;
  final int idx;
  final scroll;

  ModelList({Key key, this.tag, this.idx, this.callback, this.scroll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ts.white,
      child: CustomScrollView(
        controller: scroll,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Text("select model"),
            centerTitle: false,
            backgroundColor: ts.grey1,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Builder(builder: (
                context,
              ) {
                var list = cs.carsList.elementAt(idx);

                return Wrap(
                  children: [
                    ...list.map((e) {
                      return InkWell(
                        onTap: () {
                          var index = list.indexOf(e);
                          cs.setMakeAndModel(idx, index);
                          Get.close(1);
                        },
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ts.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 2, color: ts.grey),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: ts.grey.withOpacity(.13))
                              ]),
                          padding: EdgeInsets.symmetric(
                              horizontal: 33, vertical: 10),
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                e.toString(),
                                style: TextStyle(
                                    color: ts.grey1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
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
                // color: ts.bg.value,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  width: 1,
                  //  color: ts.bg.value.darker()
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 14,
                      // color: ts.fgt.value.withOpacity(.3),
                      offset: Offset(1, 3))
                ]),
            child: Column(
              children: [
                Text("Select Model").huge(),
                SizedBox(
                  height: 12,
                ),
                Container(
                  child: Text(cs.carsList.elementAt(idx).elementAt(0)).hunch(),
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
                                  // color: ts.fg.value,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      // width: 1, color: ts.bg.value.darker()
                                      ),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        // color: ts.fgt.value.withOpacity(.05),
                                        offset: Offset(1, 3))
                                  ]),
                              child: Text(list.elementAt(index).toString())
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
