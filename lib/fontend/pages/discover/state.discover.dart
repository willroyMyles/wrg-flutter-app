import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/enums/enum.post.dart';
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
  List<String> filter = [];
  int filterIndex = 0;
  @override
  void onInit() {
    super.onInit();
    configure();
    getMorePosts();
  }

  void configure() {
    info.feed.listen((posts) {
      map.addAll(Map<String, PostModel>.from(posts));
      if (map.length == 0) return change("", status: RxStatus.empty());
      Future.delayed(Duration(milliseconds: 2250), () {
        return change("", status: RxStatus.success());
      });
    });
    // filter = ["all", ...Status.values.map((e) => e.toString())];
  }

  onTap() {
    // change(null, status: RxStatus.empty());
  }

  onFAB() {
    homeState.setPanelWidget(CreatePost());
    homeState.showPanel();
  }

  Future<bool> getMorePosts() async {
    change("", status: RxStatus.loading());
    await Future.delayed(Duration(milliseconds: 1000));
    var res = await api.getPosts();
    change("", status: RxStatus.success());

    return Future.value(true);
  }
}
