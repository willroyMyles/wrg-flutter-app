import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/pages/create/view.create.dart';
import 'package:wrg2/fontend/pages/state.homepage.dart';

class DiscoverState extends GetxController with StateMixin {
  final api = Get.find<APIService>();
  final info = Get.find<InformationService>();
  final homeState = Get.find<HomePageState>();
  Map<String, PostModel> map = {};

  @override
  void onInit() {
    super.onInit();
    configure();
    getMorePosts();
    change("", status: RxStatus.success());
  }

  @override
  void onReady() {
    super.onReady();
    print("ready");
    change("", status: RxStatus.success());
  }

  void configure() {
    info.feed.listen((posts) {
      map.addAll(Map<String, PostModel>.from(posts));
      if (map.length == 0) return change("", status: RxStatus.empty());
      return change("", status: RxStatus.success());
    });
  }

  onTap() {
    change(null, status: RxStatus.empty());
  }

  onFAB() {
    homeState.setPanelWidget(CreatePost());
    homeState.showPanel();
  }

  getMorePosts() async {
    api.getPosts();
  }
}
