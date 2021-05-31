import 'package:get/get.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';

class FeedDetailsState extends GetxController {
  final infoService = Get.find<InformationService>();
  final service = Get.find<APIService>();
  @override
  void onInit() {
    super.onInit();
    configure();
  }

  void configure() {
    infoService.watching.listen((watching) {
      refresh();
    });
  }

  onWatchPressed(PostModel post) {
    service.modifyWatched(post, add: !post.isWatching());
  }
}
