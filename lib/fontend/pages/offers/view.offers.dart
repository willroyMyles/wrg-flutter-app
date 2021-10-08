import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/fontend/components/loading.dart';
import 'package:wrg2/fontend/pages/conversation/section/view.conversationList.dart';
import 'package:wrg2/fontend/pages/offers/postModelList.dart';
import 'package:wrg2/fontend/pages/offers/state.offers.dart';

class OfferView extends StatelessWidget {
  OfferView({Key key}) : super(key: key);

  final controller = Get.put(OfferState());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferState>(builder: (controller) {
      if (controller.status.isLoading)
        return Container(
          alignment: Alignment.center,
          height: 100,
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          decoration: BoxDecoration(
              color: ts.white, borderRadius: BorderRadius.circular(7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Loading Offers...").hunch(),
              SizedBox(
                width: 20,
              ),
              LoadingView()
            ],
          ),
        );
      if (controller.status.isEmpty)
        return Container(
          alignment: Alignment.center,
          height: 100,
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          decoration: BoxDecoration(
              color: ts.white, borderRadius: BorderRadius.circular(7)),
          child: Text("No Conversations As Yet...").hunch(),
        );
      if (controller.status.isSuccess)
        return Container(
            width: Get.width / 2,
            height: 150,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(left: 22, right: 22, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: ts.white,
              border: Border.all(width: 1, color: ts.grey.withOpacity(0)),
              boxShadow: [
                BoxShadow(blurRadius: 15, color: ts.grey.withOpacity(.1))
              ],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.map.length.toString() + " Offers").h1(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          SizedBox(height: 10),
                          FlatButton(
                                  onPressed: () {
                                    Get.to(() => PostModelList(
                                          models: controller.superMap,
                                        ));
                                  },
                                  child: Text("view offers"))
                              .secondary()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));

      return Container();
    });
  }
}
