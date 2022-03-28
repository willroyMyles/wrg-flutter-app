import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/fontend/pages/conversation/view.conversation.dart';
import 'package:wrg2/fontend/pages/offers/state.offers.dart';

class OffersListView extends StatelessWidget {
  final PostModel model;
  final List<OfferModel> offers;
  OffersListView({Key key, this.model, this.offers}) : super(key: key);
  final controller = Get.find<OfferState>();
  //get sender info

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: ts.white,
        child: CustomScrollView(
          primary: false,
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text(model.title),
              backgroundColor: ts.grey1,
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  "${offers.length} offers available",
                  textScaleFactor: 1,
                  style: TextStyle(color: ts.grey, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              sliver: SliverGrid(
                  delegate: SliverChildListDelegate([
                    ...offers.map((e) => InkWell(
                          onTap: () {
                            Get.to(() => ConversationView(
                                  item: e.conversation,
                                  other: e.sender,
                                ));
                          },
                          child: Container(
                            width: Get.width / 2,
                            // color: Colors.green,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: Image.network(
                                                    e.sender.userImageUrl)
                                                .image,
                                            radius: 12,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(e.sender.username),
                                                Text("").hdate(e.post.createdAt)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: Get.width / 2,
                                        child: Text(
                                          e.message,
                                          textScaleFactor: 1,
                                          maxLines: 2,
                                          overflow: TextOverflow.fade,
                                        )),
                                    Container(
                                        child: Text(
                                      "tap to view conversation",
                                      textScaleFactor: 1,
                                    ).h5()),
                                  ],
                                ),
                                if (!e.accepted)
                                  Expanded(
                                    child: Container(
                                      // width: Get.width / 3,
                                      // color: Colors.green,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () async {
                                              await controller.acceptOffer(
                                                  e.id, model.id);
                                            },
                                            child: Text("Accept"),
                                          ).accept(),
                                          TextButton(
                                                  onPressed: () async {
                                                    await controller
                                                        .decline(e.id);
                                                  },
                                                  child: Text("Decline"))
                                              .decline(),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (e.accepted)
                                  Expanded(
                                    child: Container(
                                      // width: Get.width / 3,
                                      // color: Colors.green,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () async {
                                              await controller
                                                  .updateOffer(e.id);
                                            },
                                            child: Text("update"),
                                          ).accept(),
                                        ],
                                      ),
                                    ),
                                  )
                              ],
                            ),
                            decoration: Constants.decoration.copyWith(
                                color: e.accepted
                                    ? Colors.green.withOpacity(.03)
                                    : Colors.white),
                          ),
                        ))
                  ]),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 130)),
            ),
          ],
        ),
      ),
    );
  }
}
