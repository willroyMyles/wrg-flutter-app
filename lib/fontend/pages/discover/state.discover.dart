import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';

class DiscoverState extends GetxController with StateMixin {
  final api = Get.find<APIService>();
  final info = Get.find<InformationService>();
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

  getMorePosts() async {
    api.getPosts();
  }
}
