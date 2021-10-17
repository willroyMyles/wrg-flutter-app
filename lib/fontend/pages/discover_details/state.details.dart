import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/messages.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/components/item.comment.dart';
import 'package:wrg2/fontend/components/loading.dart';
import 'package:wrg2/backend/extensions/ext.dart' hide ts;
import 'package:wrg2/fontend/components/loadingButton.dart';
import 'package:wrg2/fontend/pages/conversation/view.conversation.dart';

class FeedDetailsState extends GetxController with StateMixin {
  final infoService = Get.find<InformationService>();
  final service = Get.find<APIService>();
  List<CommentModel> listOfComments = [];
  PostModel currentPostModel;
  TextEditingController input = TextEditingController();
  TextEditingController convo = TextEditingController();
  bool isOffer = false;
  bool showAll = true;
  bool isShowing = false;

  RxStatus sendMessageStatus = RxStatus.success();
  RxBool send = false.obs;

  String id = "";
  @override
  void onInit() {
    super.onInit();
    configure();
  }

  void setPostModel(PostModel model) async {
    currentPostModel = model;
    try {
      var res = await service.incrimentView(currentPostModel.id);
      if (res) {
        model.views += 1;
        infoService.feed.value.update(model.id, (value) => model);
        refresh();
      }
    } catch (e) {
      print(e);
    }
  }

  void configure() {
    infoService.watching.listen((watching) {
      refresh();
    });
    send.listen((data) {
      print(data);
      refresh();
    });
  }

  onWatchPressed(PostModel post) {
    service.modifyWatched(post, add: !post.isWatching());
  }

  onSendMessagePressed(CommentModel item) {
    Get.close(1);
    Get.bottomSheet(this.obx(
      (state) => AnimatedContainer(
          duration: Duration(milliseconds: 350),
          margin: EdgeInsets.only(bottom: 0),
          padding: EdgeInsets.all(10),
          height: 100,
          width: Get.width,
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: Get.width - 100,
                        child: TextFormField(
                          controller: convo,
                        ).input(label: "start conversation")),
                    InkWell(
                      onTap: () {
                        crazy.loginguard("make a comment or Offer", () async {
                          sendMessageStatus = RxStatus.loading();
                          await sendConversation(item);
                          sendMessageStatus = RxStatus.success();
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(.2))
                              ]),
                          child: Icon(CupertinoIcons.chat_bubble_2)),
                    )
                  ],
                ),
              ),
            ],
          )),
    ));
  }

  onCommentItemPressed(CommentModel model) {
    if (isShowing) {
      id = "";
      isShowing = false;
    } else {
      id = model.id;
      isShowing = true;
    }
    refresh();
  }

  onCommentPressed(PostModel post) {
    currentPostModel = post;
    getComments();
    Get.bottomSheet(
        BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.transparent,
          builder: (context) => Stack(
            children: [
              DraggableScrollableSheet(
                initialChildSize: 1,
                maxChildSize: 1,
                minChildSize: .9,
                builder: (context, scrollController) {
                  return GetBuilder<FeedDetailsState>(
                    init: this,
                    builder: (controller) {
                      List<CommentModel> lis = listOfComments;
                      lis = listOfComments
                          .where((element) => showAll ? true : element.isOffer)
                          .toList();
                      return CustomScrollView(
                        physics: ClampingScrollPhysics(),
                        controller: scrollController,
                        slivers: [
                          SliverAppBar(
                            backgroundColor: ts.grey1,
                            automaticallyImplyLeading: false,
                            toolbarHeight: 50,
                            pinned: true,
                            title: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Comments",
                                style: TextStyle(
                                    color: ts.white,
                                    backgroundColor: Colors.transparent),
                              ),
                            ),
                          ),
                          SliverAppBar(
                            elevation: 5,
                            shadowColor: Colors.green.withOpacity(.2),
                            pinned: true,
                            floating: true,
                            snap: true,
                            automaticallyImplyLeading: false,
                            toolbarHeight: 2,
                            title: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  // ToggleSwitch(
                                  //   totalSwitches: 2,
                                  //   labels: ["All", "Offers"],
                                  //   initialLabelIndex: showAll ? 0 : 1,
                                  //   activeBgColor: [Colors.green],
                                  //   onToggle: (index) {
                                  //     showAll = index == 0;
                                  //     refresh();
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          if (this.status.isEmpty)
                            SliverPadding(
                              padding: EdgeInsets.all(20),
                              sliver: SliverFillRemaining(
                                  child:
                                      empty(msg: "No Comments for this post")),
                            ),
                          if (this.status.isLoading)
                            SliverPadding(
                              padding: EdgeInsets.only(bottom: 100),
                              sliver: SliverList(
                                  delegate: SliverChildListDelegate([
                                ...[0, 1, 2, 3, 4, 5].map((e) {
                                  return CommentItem(
                                    item: null,
                                    loading: true,
                                  );
                                })
                              ])),
                            ),
                          if (this.status.isSuccess)
                            SliverPadding(
                              padding: EdgeInsets.only(bottom: 100),
                              sliver: SliverList(
                                  delegate: SliverChildListDelegate([
                                ...lis.map((e) {
                                  return CommentItem(
                                    item: e,
                                  );
                                })
                              ])),
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
              Positioned(
                bottom: 30,
                right: 30,
                child: InkWell(
                  onTap: () {
                    crazy.loginguard("Make a comment or offer", () {
                      showInputBottomSheet();
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Icon(
                      CupertinoIcons.chat_bubble_2_fill,
                      color: ts.lightTheme.primaryColor,
                    ),
                    decoration: BoxDecoration(
                        color: ts.grey1,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              color: ts.grey.withOpacity(.9))
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white);
  }

  Future sendComment() async {
    if (isOffer) {
      OfferModel model = OfferModel.empty();
      model.message = input.text;
      model.postId = currentPostModel.id;
      model.recieverId = currentPostModel.userInfoId;
      var res = await service.createOffer(model);
      input.clear();
    } else {
      CommentModel model = CommentModel.empty();
      model.isOffer = isOffer;
      model.postId = currentPostModel.id;
      model.content = input.text;
      var ans = await service.createComment(model);
      input.clear();

      if (Get.isDialogOpen) {
        Get.close(1);
      }
    }

    return Future.value(true);
  }

  void getComments() async {
    change("", status: RxStatus.loading());
    try {
      var ans = await service.getComments(currentPostModel.id);
      listOfComments = ans;
      change("", status: RxStatus.success());
      if (listOfComments.length == 0) change("", status: RxStatus.empty());
    } catch (e) {
      change("", status: RxStatus.error(e));
      change("", status: RxStatus.empty());
    }
  }

  void showInputBottomSheet() {
    Get.close(1);
    change("", status: RxStatus.success());

    Get.bottomSheet(BottomSheet(
      onClosing: () {},
      builder: (context) {
        return this.obx(
          (state) => AnimatedContainer(
              duration: Duration(milliseconds: 350),
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.all(10),
              height: 190,
              width: Get.width,
              decoration: BoxDecoration(color: Colors.white),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: Get.width - 100,
                            child: TextFormField(
                              controller: input,
                            ).input()),
                        LoadingButton(
                            icon: CupertinoIcons.paperplane,
                            loading: send.value,
                            callback: () {
                              crazy.loginguard("make a comment or Offer",
                                  () async {
                                send.value = true;
                                await sendComment();
                                send.value = false;
                              });
                            }),
                        // InkWell(
                        //   onTap: () {
                        //     sendComment();
                        //   },
                        //   child: Container(
                        //       padding: EdgeInsets.all(10),
                        //       margin: EdgeInsets.only(top: 20),
                        //       decoration: BoxDecoration(
                        //           color: ts.grey1,
                        //           borderRadius: BorderRadius.circular(100),
                        //           boxShadow: [
                        //             BoxShadow(
                        //                 offset: Offset(5, 5),
                        //                 blurRadius: 10,
                        //                 color: ts.grey.withOpacity(.9))
                        //           ]),
                        //       child: Icon(
                        //         isOffer
                        //             ? CupertinoIcons.paperplane_fill
                        //             : CupertinoIcons.paperplane,
                        //         color: ts.lightTheme.primaryColor,
                        //       )),
                        // )
                      ],
                    ),
                  ),
                  if (!currentPostModel.amIOwner())
                    Container(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: isOffer,
                        activeColor: ts.grey1,
                        checkColor: ts.grey1,
                        selected: true,
                        isThreeLine: true,
                        shape: CircleBorder(
                            side: BorderSide(color: ts.grey1, width: 5)),
                        subtitle:
                            Text("when selected, you can make an offer").h4(),
                        onChanged: (value) {
                          isOffer = value;
                          refresh();
                        },
                        title: Text(
                          "is offer?",
                          style: TextStyle(color: ts.grey1),
                        ),
                      ),
                    )
                ],
              )),
        );
      },
    ));
  }

  Future<bool> sendConversation(CommentModel item) async {
    try {
      ConversationModel model = ConversationModel.empty();
      model.commentId = item.id;
      MessagesModel mm = MessagesModel(content: convo.text, id: "", sender: "");
      model.messages.add(mm);
      var res = await service.createConversation(model, currentPostModel);
      return Future.value(true);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }
}
