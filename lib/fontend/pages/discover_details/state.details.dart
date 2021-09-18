import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/fontend/components/item.comment.dart';
import 'package:wrg2/fontend/components/loading.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class FeedDetailsState extends GetxController with StateMixin {
  final infoService = Get.find<InformationService>();
  final service = Get.find<APIService>();
  List<CommentModel> listOfComments = [];
  PostModel currentPostModel;
  TextEditingController input = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    configure();
  }

  void setPostModel(PostModel model) {
    currentPostModel = model;
  }

  void configure() {
    infoService.watching.listen((watching) {
      refresh();
    });
  }

  onWatchPressed(PostModel post) {
    service.modifyWatched(post, add: !post.isWatching());
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
                    builder: (controller) => CustomScrollView(
                      physics: ClampingScrollPhysics(),
                      controller: scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            child: Text("Comments").h1(),
                            color: Colors.white,
                          ),
                        ),
                        if (this.status.isLoading)
                          SliverFillRemaining(
                            child: LoadingView(),
                          ),
                        if (this.status.isSuccess)
                          SliverFillRemaining(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return CommentItem(
                                  item: listOfComments.elementAt(index),
                                );
                              },
                              itemCount: listOfComments.length,
                              controller: scrollController,
                            ),
                          ),
                        SliverToBoxAdapter(
                          child: Container(
                            height: 70,
                            width: Get.width,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
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
                    child: Icon(CupertinoIcons.chat_bubble),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black.withOpacity(.2))
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
    model.isOffer = false;
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
    Get.bottomSheet(Container(
        margin: EdgeInsets.all(10),
        height: 80,
        width: Get.width,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: Get.width - 100,
                child: TextFormField(
                  controller: input,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(.9),
                      filled: true,
                      hasFloatingPlaceholder: false,
                      focusColor: Colors.black,
                      labelText: "Comment here",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(100),
                      )),
                )),
            InkWell(
              onTap: () {
                sendComment();
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10, color: Colors.black.withOpacity(.2))
                      ]),
                  child: Icon(CupertinoIcons.paperplane)),
            )
          ],
        )));
  }
}
