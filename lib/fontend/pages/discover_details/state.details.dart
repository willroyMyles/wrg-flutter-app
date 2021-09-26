import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/messages.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/components/item.comment.dart';
import 'package:wrg2/fontend/components/loading.dart';
import 'package:wrg2/backend/extensions/ext.dart';
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
        infoService.feed.update(model.id, (value) => model);
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
                        sendConversation(item);
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
                            backgroundColor: Colors.transparent,
                            automaticallyImplyLeading: false,
                            title: Container(
                              padding: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              child: Text("Comments").h2(),
                              color: Colors.white,
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
                          if (this.status.isLoading)
                            SliverFillRemaining(
                              child: LoadingView(),
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
                    showInputBottomSheet();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Icon(
                      CupertinoIcons.chat_bubble_2_fill,
                      color: ts.lightTheme.primaryColor,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              color: ts.lightTheme.primaryColor
                                  .lighter()
                                  .withOpacity(.3))
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white);
  }

  void sendComment() async {
    CommentModel model = CommentModel.empty();
    model.isOffer = isOffer;
    model.postId = currentPostModel.id;
    model.content = input.text;
    var ans = await service.createComment(model);
  }

  void getComments() async {
    try {
      var ans = await service.getComments(currentPostModel.id);
      listOfComments = ans;
      change("", status: RxStatus.success());
    } catch (e) {
      change("", status: RxStatus.error(e));
    }
  }

  void showInputBottomSheet() {
    Get.close(1);
    Get.bottomSheet(this.obx(
      (state) => AnimatedContainer(
          duration: Duration(milliseconds: 350),
          margin: EdgeInsets.only(bottom: 0),
          padding: EdgeInsets.all(10),
          height: 170,
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
                    InkWell(
                      onTap: () {
                        sendComment();
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    color: ts.lightTheme.primaryColor
                                        .lighter()
                                        .withOpacity(.2))
                              ]),
                          child: Icon(
                            isOffer
                                ? CupertinoIcons.paperplane_fill
                                : CupertinoIcons.paperplane,
                            color: ts.lightTheme.primaryColor,
                          )),
                    )
                  ],
                ),
              ),
              Container(
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: isOffer,
                  subtitle: Text("when selected, you can make an offer").h4(),
                  onChanged: (value) {
                    isOffer = value;
                    refresh();
                  },
                  title: Text("is offer?").h2(),
                ),
              )
            ],
          )),
    ));
  }

  void sendConversation(CommentModel item) async {
    try {
      ConversationModel model = ConversationModel.empty();
      model.commentId = item.id;
      MessagesModel mm = MessagesModel(content: convo.text, id: "", sender: "");
      model.messages.add(mm);
      var res = await service.createConversation(model, currentPostModel);
    } catch (e) {
      print(e);
    }
  }
}
