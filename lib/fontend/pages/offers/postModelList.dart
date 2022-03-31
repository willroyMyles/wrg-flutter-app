import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/fontend/components/headerWidget.dart';
import 'package:wrg2/fontend/components/item.postOffers.dart';
import 'package:wrg2/fontend/pages/conversation/view.conversation.dart';

class PostModelListState extends GetxController {
  int currentIndex = -1;
  List<CrossFadeState> states = [];

  updateExpanded(int index) {
    var cstate = states.elementAt(index);
    if (cstate == CrossFadeState.showFirst) {
      cstate = CrossFadeState.showSecond;
    } else {
      cstate = CrossFadeState.showFirst;
    }

    states[index] = cstate;
    refresh();
    print("updated");
  }

  buildCrossfadeList(List<String> modelKeys) {
    modelKeys.forEach((element) {
      states.add(CrossFadeState.showSecond);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

class PostModelList extends StatelessWidget {
  final Map<String, List<OfferModel>> models;
  PostModelList({Key key, this.models}) : super(key: key);
  final controller = Get.put(PostModelListState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          child: GetBuilder<PostModelListState>(initState: (state) {
        controller.buildCrossfadeList(models.keys.toList());
      }, builder: (con) {
        return Container(
          child: Column(
            children: [
              HeaderWidget("offers", tag: "Your current Offers"),
              Expanded(
                child: ListView.builder(
                  itemCount: models.length,
                  itemBuilder: (context, index) {
                    var model = models.values.elementAt(index).first.post;
                    var offers = models.values.elementAt(index);

                    var selected = index == con.currentIndex;
                    var length = models.values.elementAt(index).length;

                    return Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(Constants.br)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    con.updateExpanded(index);
                                  },
                                  child: Container(
                                    width: Get.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(model.title).h2(),
                                        Text("${length} offer${length > 1 ? 's' : ''}")
                                            .h4(),
                                      ],
                                    ),
                                  ),
                                ),
                                AnimatedCrossFade(
                                    firstChild: Container(),
                                    secondChild: Container(
                                      margin: EdgeInsets.only(top: 15),
                                      // color: Colors.red,
                                      child: Column(children: [
                                        ...offers.map((e) => InkWell(
                                              onTap: () {
                                                print(e);
                                                Get.to(() => ConversationView(
                                                      item: e.conversation,
                                                      other: e.sender,
                                                    ));
                                              },
                                              child: Container(
                                                // width: Get.width,
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 6),
                                                child: Row(
                                                  // mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CircleAvatar(
                                                                backgroundImage:
                                                                    Image.network(e
                                                                            .sender
                                                                            .userImageUrl)
                                                                        .image,
                                                                radius: 12,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Container(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(e
                                                                        .sender
                                                                        .username),
                                                                    Text("").hdate(e
                                                                        .post
                                                                        .createdAt)
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                            width:
                                                                Get.width / 2,
                                                            child: Text(
                                                              e.message,
                                                              textScaleFactor:
                                                                  1,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                            )),
                                                        Container(
                                                            child: Text(
                                                          "tap to view conversation",
                                                          textScaleFactor: 1,
                                                        ).h5()),
                                                      ],
                                                    ),
                                                    // if (!e.accepted)
                                                    //   Expanded(
                                                    //     child: Container(
                                                    //       // width: Get.width / 3,
                                                    //       // color: Colors.green,
                                                    //       child: Column(
                                                    //         mainAxisAlignment:
                                                    //             MainAxisAlignment
                                                    //                 .center,
                                                    //         crossAxisAlignment:
                                                    //             CrossAxisAlignment.end,
                                                    //         children: [
                                                    //           TextButton(
                                                    //             onPressed: () async {
                                                    //               // await controller.acceptOffer(
                                                    //               //     e.id, model.id);
                                                    //             },
                                                    //             child: Text("Accept"),
                                                    //           ).accept(),
                                                    //           SizedBox(
                                                    //             height: 10,
                                                    //           ),
                                                    //           TextButton(
                                                    //                   onPressed:
                                                    //                       () async {
                                                    //                     // await controller
                                                    //                     //     .decline(e.id);
                                                    //                   },
                                                    //                   child: Text(
                                                    //                       "Decline"))
                                                    //               .decline(),
                                                    //         ],
                                                    //       ),
                                                    //     ),
                                                    //   ),
                                                    if (e.accepted)
                                                      Expanded(
                                                        child: Container(
                                                          // width: Get.width / 3,
                                                          // color: Colors.green,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  // await controller
                                                                  //     .updateOffer(e.id);
                                                                },
                                                                child: Text(
                                                                    "update"),
                                                              ).accept(),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                  ],
                                                ),
                                                decoration: Constants.decoration
                                                    .copyWith(
                                                        color: e.accepted
                                                            ? Colors.green
                                                                .withOpacity(
                                                                    .03)
                                                            : Colors.white),
                                              ),
                                            ))
                                      ]),
                                    ),
                                    crossFadeState: con.states.elementAt(index),
                                    duration: Constants.durationShort),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );

                    return Container(
                        child: Expandable(
                      // controller: con.expanCont,
                      collapsed: ExpandableButton(
                        child: Container(
                          width: Get.width,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Constants.br)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(model.title),
                              Text(
                                  "${models.values.elementAt(index).length}  offers"),
                            ],
                          ),
                        ),
                      ),
                      expanded: ExpandableButton(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
                  },
                ),
              ),
            ],
          ),
        );
      })),
      // body: SafeArea(
      //   child: Container(
      //     child: CustomScrollView(
      //       primary: false,
      //       slivers: [
      //         SliverList(
      //           delegate: SliverChildListDelegate([
      //             ...models.entries.map((e) => PostOfferItem(
      //                   list: e.value,
      //                   postModelId: e.key,
      //                 ))
      //           ]),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
