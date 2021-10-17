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

  void getOffers() async {
    change(null, status: RxStatus.loading());
    await service.getUserOffers();
  }

  void initialize() async {
    infoService.offers.listen((offers) {
      superMap.clear();
      for (var offer in offers.values) {
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
      var isEmpty = superMap.length == 0;
      if (isEmpty)
        change("", status: RxStatus.empty());
      else
        change(null, status: RxStatus.success());
    });
  }
}
