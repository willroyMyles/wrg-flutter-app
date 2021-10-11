import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/enums/enum.post.dart';
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
  List<String> states = ["All", "open", "processing"];
  int currentStateIndex = 0;
  Status filteredStatus = Status.OPEN;

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

  void doFilter() async {
    void setNormal() {
      map.addAll(Map<String, PostModel>.from(info.feed.value));
      front = map;
    }

    noMorePosts = false;

    switch (currentStateIndex) {
      case 0:
        setNormal();
        filteredStatus = null;
        break;
      case 1:
        filteredStatus = Status.OPEN;
        await getPosts();
        var tempMap = Map<String, PostModel>.from(info.processed.value);

        processed = Map<String, PostModel>.fromIterable(
          tempMap.values.where((element) => element.status == Status.OPEN),
          key: (element) => element.id,
          value: (element) => element,
        );
        front = processed;

        break;
      case 2:
        filteredStatus = Status.PROCESSING;
        await getPosts();

        var tempMap = Map<String, PostModel>.from(info.processed.value);

        processed = Map<String, PostModel>.fromIterable(
          tempMap.values
              .where((element) => element.status == Status.PROCESSING),
          key: (element) => element.id,
          value: (element) => element,
        );
        front = processed;

        break;
      default:
        filteredStatus = null;
        setNormal();

        break;
    }

    return change("", status: RxStatus.success());
  }

  onStateTapped(int index) async {
    currentStateIndex = index;
    doFilter();
  }

  Future<bool> getPosts() async {
    if (noMorePosts) noMorePosts = false;
    change("", status: RxStatus.loading());
    var res = await api.getPosts(status: filteredStatus);
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
    controller.animateTo(controller.position.pixels + 80,
        duration: Constants.durationLong, curve: Curves.decelerate);
  }
}
