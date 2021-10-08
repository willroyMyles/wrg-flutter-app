import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.helper.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/pages/offers/offersListView.dart';

class PostOfferItem extends StatelessWidget {
  final String postModelId;
  final List<OfferModel> list;
  PostOfferItem({Key key, this.postModelId, this.list}) : super(key: key);
  final bgTag = getTag();
  final offerTag = getTag();
  final infoService = Get.find<InformationService>();

  getModel() {
    return list.where((element) => element.postId == postModelId).first.post;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => OffersListView(
              model: getModel(),
              offers: list,
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        clipBehavior: Clip.antiAlias,
        decoration: Constants.decoration,
        child: Column(
          children: [
            Container(
              // color: ts.grey,
              // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    width: Get.width / 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getModel().title,
                          textScaleFactor: 1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: ts.grey1, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ts.white,
                        boxShadow: [BoxShadow(blurRadius: 10, color: ts.white)],
                        border: Border(
                            left: BorderSide(
                                width: 1, color: ts.grey.withOpacity(.3)))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          list.length.toString(),
                          style: TextStyle(
                              color: ts.red,
                              fontWeight: FontWeight.w700,
                              shadows: [
                                Shadow(
                                    blurRadius: 10,
                                    color: ts.red.withOpacity(.2))
                              ],
                              fontSize: 20),
                        ),
                        Text(list.length > 1 ? "offers" : "offer"),
                      ],
                    ),
                  ).fadeInDown()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
