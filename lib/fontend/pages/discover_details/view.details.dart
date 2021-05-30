import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/avatar.dart';
import 'package:wrg2/fontend/pages/comment/state.comment.dart';
import 'package:wrg2/fontend/pages/comment/view.comment.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class DiscoverDetails extends StatelessWidget {
  final PostModel item;

  DiscoverDetails({Key key, this.item}) : super(key: key);

  final ts = Get.find<ServiceTheme>();
  final commentController = Get.put(CommentState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ts.fg.value,
        centerTitle: true,
        title: Text(
          item.title,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(color: ts.fgt.value),
        ),
      ),
      body: SafeArea(
        child: SlidingUpPanel(
          controller: commentController.pc,
          minHeight: 80,
          parallaxEnabled: true,
          boxShadow: [],
          backdropOpacity: 0.2,
          backdropEnabled: true,
          backdropColor: Colors.black,
          parallaxOffset: .01,
          isDraggable: true,
          onPanelSlide: (position) {
            if (position >= .95) {
              commentController.configure(item.id);
              commentController.setCanFetch(false);
            }

            if (position <= .2) {
              commentController.setEmpty();
              commentController.setCanFetch(true);
            }
          },
          onPanelOpened: () {
            commentController.updatePadding(0);
          },
          onPanelClosed: () {
            commentController.updatePadding(40);
          },
          collapsed: Container(
            alignment: Alignment.center,
            child: Texxt("view comments").h2(withStr: false),
          ),
          panel: Container(
            alignment: Alignment.center,
            child: CommentView(
              postId: item.id,
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                color: ts.fg.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Texxt(item.title).h1(),
                    Divider(),
                    Texxt(item.content).h2(),
                    Divider(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Texxt(item.make).h3(),
                          Texxt(item.model).h3(),
                          Texxt(item.year.toString()).h3(),
                        ],
                      ),
                    ),
                    Texxt(item.category).h3(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          WRGAvatar(
                            size: 25,
                            imgSrc: item.userInfo.userImageUrl,
                          ),
                          Texxt(item.userInfo.username).user(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Text("watch"),
                      color: ts.fg.value,
                    ).secondary(),
                    FlatButton(
                      onPressed: () {},
                      child: Text("comment"),
                      color: ts.fg.value,
                    ).secondary(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ).gradient();
  }
}
