import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/services/service.baseExecutor.dart';
import 'package:wrg2/backend/services/service.information.dart';

mixin OfferService on BaseExecutor {
  var _informationService = Get.find<InformationService>();

  Future<dynamic> createOffer(OfferModel model) async {
    try {
      var res = await create(offer, model.toMap());
      return Future.value(res);
    } on DioError catch (e) {
      print(e);
      return Future.value(null);
    } on Exception catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  Future<dynamic> getOffers(String id) async {
    try {
      var res = await findAll("$offer/all/$id");
      return Future.value(res);
    } on DioError catch (e) {
      print(e);
      return Future.value(null);
    } on Exception catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  Future<dynamic> acceptOffer(String id, String postId) async {
    try {
      var res =
          await updateOne("$offer", id, {"accepted": true, "postId": postId});
      return Future.value(res);
    } on DioError catch (e) {
      print(e);
      return Future.value(null);
    } on Exception catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  Future<dynamic> declineOffer(String id) async {
    try {
      var res = await findAll("$offer/all/$id");
      return Future.value(res);
    } on DioError catch (e) {
      print(e);
      return Future.value(null);
    } on Exception catch (e) {
      print(e);
      return Future.value(null);
    }
  }
}
