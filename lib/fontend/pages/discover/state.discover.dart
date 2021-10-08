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
  final homeState = Get.find<HomePageState>();
  final controller = ScrollController();
  Map<String, PostModel> map = {};
  List<String> filter = [];
  List<String> states = ["All", "open", "processing"];
  List<int> index = [0, 1, 1];
  int currentStateIndex = 0;
  int filterIndex = 0;

  bool noMorePosts = false;
  @override
  void onInit() {
    super.onInit();
    configure();
    getPosts();
  }

  void configure() {
    info.feed.listen((posts) {
      map.addAll(Map<String, PostModel>.from(posts));
      if (map.length == 0) return change("", status: RxStatus.empty());
      return change("", status: RxStatus.success());
    });
    // filter = ["all", ...Status.values.map((e) => e.toString())];
  }

  onStateTapped(int index) async {
    currentStateIndex = index;
    change(null, status: RxStatus.loading());
    await Future.delayed(Constants.durationLong * 5, () {
      change(null, status: RxStatus.success());
    });
  }

  onTap() {
    // change(null, status: RxStatus.empty());
  }

  onFAB() {
    homeState.setPanelWidget(CreatePost());
    homeState.showPanel();
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
    await Future.delayed(Duration(milliseconds: 3000));
    var res = await api.getPosts(lastId: map.values.last.id);
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
