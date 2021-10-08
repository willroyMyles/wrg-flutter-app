import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.information.dart';

class OfferState extends GetxController with StateMixin {
  var service = Get.find<APIService>();
  var infoService = Get.find<InformationService>();
  Map<String, OfferModel> map = {};
  Map<String, List<OfferModel>> superMap = {};
  bool newState = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialize();
  }

  void initialize() async {
    infoService.offers.listen((offers) {
      map = Map<String, OfferModel>.from(offers);

      for (var offer in map.values) {
        superMap.update(
          offer.postId,
          (value) {
            value.add(offer);
            var set = value.toSet();
            return set.toList();
          },
          ifAbsent: () {
            List<OfferModel> list = [];
            list.add(offer);
            return list;
          },
        );
      }

      if (map.isEmpty) return change("", status: RxStatus.empty());
      change("", status: RxStatus.success());
      refresh();
    });
  }
}
