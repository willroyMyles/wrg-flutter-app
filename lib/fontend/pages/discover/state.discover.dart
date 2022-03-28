import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/enums/enum.post.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/pages/create/view.create.dart';
import 'package:wrg2/fontend/pages/state.homepage.dart';

class DiscoverState extends GetxController with StateMixin {
  final api = Get.find<APIService>();
  final info = Get.find<InformationService>();
  final controller = ScrollController();

  Map<String, PostModel> map = {};
  Map<String, PostModel> processed = {};
  Map<String, PostModel> front = {};
  Status filteredStatus;

  bool noMorePosts = false;
  @override
  void onInit() {
    super.onInit();
    configure();
  }

  void configure() {
    info.feed.listen((posts) {
      map.addAll(Map<String, PostModel>.from(posts));
      if (map.length == 0) return change("", status: RxStatus.empty());
      front = map;
      change(null, status: RxStatus.success());
    });

    info.processed.listen((posts) {
      processed.addAll(Map<String, PostModel>.from(posts));
      if (processed.length == 0) return change("", status: RxStatus.empty());
      front = processed;

      change(null, status: RxStatus.success());
    });

    getPosts();
  }

  onFilterPressed(int index) {
    if (index < 0)
      filteredStatus = null;
    else
      filteredStatus = Status.values.elementAt(index);

    refresh();
  }

  void doFilter() async {
    void setNormal() {
      map.addAll(Map<String, PostModel>.from(info.feed.value));
      front = map;
      if (map.length == 0) getPosts();
    }

    noMorePosts = false;

    await getPosts();

    if (filteredStatus == null) {
      setNormal();
      front = map;
    } else {
      var tempMap = Map<String, PostModel>.from(info.processed.value);
      processed = Map<String, PostModel>.fromIterable(
        tempMap.values.where((element) => element.status == filteredStatus),
        key: (element) => element.id,
        value: (element) => element,
      );
      front = processed;
    }

    return change("", status: RxStatus.success());
  }

  onStateTapped(int index) async {
    // currentStateIndex = index;
    doFilter();
  }

  Future<bool> getPosts() async {
    if (noMorePosts) noMorePosts = false;
    change("", status: RxStatus.loading());
    var res = await api.getPosts();
    if (!res) {
      setNoMorePosts();
    }

    return Future.value(true);
  }

  Future<void> loadMorePosts() async {
    if (status.isLoadingMore || status.isLoading) return;
    if (noMorePosts) return;
    change("", status: RxStatus.loadingMore());
    var res =
        await api.getPosts(lastId: map.values.last.id, status: filteredStatus);
    if (!res) {
      setNoMorePosts();
    }
    change("", status: RxStatus.success());

    return;
  }

  setNoMorePosts() {
    noMorePosts = true;
    change("", status: RxStatus.success());
    // controller.animateTo(controller.position.pixels + 80,
    //     duration: Constants.durationLong, curve: Curves.decelerate);
  }

  showBottomFilter() async {
    await Get.bottomSheet(
      DraggableScrollableSheet(
        initialChildSize: .9,
        maxChildSize: .9,
        minChildSize: .2,
        expand: true,
        builder: (context, scrollController) {
          return GetBuilder<DiscoverState>(
            init: this,
            builder: (_) {
              return Container(
                color: ts.grey1,
                padding: EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          this.onFilterPressed(-10);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "All",
                                style: TextStyle(
                                    color: ts.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              if (filteredStatus == null)
                                Icon(CupertinoIcons.check_mark_circled_solid,
                                    color: Colors.green)
                            ],
                          ),
                        ).fadeInUp(),
                      ),
                      ...Status.values.map((e) => InkWell(
                            onTap: () {
                              this.onFilterPressed(e.index);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    e.name.capitalize,
                                    style: TextStyle(color: ts.white),
                                  ),
                                  if (filteredStatus == e)
                                    Icon(
                                        CupertinoIcons.check_mark_circled_solid,
                                        color: Colors.green)
                                ],
                              ),
                            ).fadeInUp(),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      isDismissible: true,
    );

    doFilter();
  }
}
