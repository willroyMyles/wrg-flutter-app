import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/fontend/pages/conversation/view.conversation.dart';

class OffersListView extends StatelessWidget {
  final PostModel model;
  final List<OfferModel> offers;
  OffersListView({Key key, this.model, this.offers}) : super(key: key);

  //get sender info

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: ts.white,
        child: CustomScrollView(
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
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            Image.network(e.sender.userImageUrl)
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
                                    child: Text(
                                  e.message,
                                  textScaleFactor: 1,
                                )),
                                Container(
                                    child: Text(
                                  "tap to view conversation",
                                  textScaleFactor: 1,
                                ).h4()),
                              ],
                            ),
                            decoration: Constants.decoration,
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