import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/fontend/components/loading.dart';
import 'package:wrg2/fontend/pages/conversation/section/view.conversationList.dart';
import 'package:wrg2/fontend/pages/offers/offersListView.dart';
import 'package:wrg2/fontend/pages/offers/postModelList.dart';
import 'package:wrg2/fontend/pages/offers/state.offers.dart';

class OfferView extends StatelessWidget {
  OfferView({Key key}) : super(key: key);

  final controller = Get.put(OfferState());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferState>(builder: (controller) {
      return Expanded(
        flex: 1,
        child: Container(
            height: 100,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
                color: ts.white,
                borderRadius: BorderRadius.circular(Constants.br)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        child: Icon(CupertinoIcons.sparkles),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            borderRadius: BorderRadius.circular(Constants.br)),
                      ),
                    ),
                    if (!controller.status.isLoading)
                      InkWell(
                        onTap: () {
                          controller.getOffers();
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text("${controller.superMap.length} offers"),
                        ),
                      ),
                  ],
                ),
                if (controller.status.isLoading &&
                    controller.infoService.isSignedIn.value)
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text("loading offers"),
                          SizedBox(
                            height: 5,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.transparent,
                              minHeight: 8,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      )),
                if (controller.superMap.length == 0 &&
                    controller.infoService.isSignedIn.value &&
                    !controller.status.isLoading)
                  Container(
                    child: Text("you have no offers"),
                  ),
                if (!controller.infoService.isSignedIn.value)
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "you need to be signed in to view offers",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (controller.superMap.length > 0)
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        Get.to(() => PostModelList(
                              models: controller.superMap,
                            ));
                      },
                      child: Text("view offers"),
                    ).secondary(),
                  ),
              ],
            )),
      );
    });
  }
}
