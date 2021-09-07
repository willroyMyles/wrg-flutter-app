import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/fontend/components/avatar.dart';
import 'package:wrg2/fontend/components/item.comment.dart';
import 'package:wrg2/fontend/pages/comment/state.comment.dart';

class CommentView extends StatelessWidget {
  final String postId;

  CommentView({
    Key key,
    this.postId,
  }) : super(key: key);
  final CommentState controller = Get.find<CommentState>();
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return Stack(
          children: [
            AnimatedContainer(
                duration: Duration(milliseconds: 1350),
                padding: EdgeInsets.only(top: 0),
                child: Container(
                  child: Column(
                    children: [
                      // Container(
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         width: Get.width,
                      //         padding: EdgeInsets.only(top: 15),
                      //         alignment: Alignment.center,
                      //         child: GroupButton(
                      //           isRadio: true,
                      //           spacing: 10,
                      //           onSelected: (index, isSelected) => controller
                      //               .updateSelected(index, isSelected),
                      //           buttons: ["all", "offers"],
                      //           selectedButtons: ["all"],
                      //           selectedColor: ts.pc,
                      //           borderRadius: BorderRadius.circular(10),
                      //           unselectedBorderColor: Colors.grey,
                      //           unselectedShadow: [],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return CommentItem(
                                  item: controller.map.values.elementAt(index));
                            },
                            separatorBuilder: (c, i) => SizedBox(
                                  height: 7,
                                ),
                            itemCount: controller.map.length),
                      ),
                    ],
                  ),
                )),
            AnimatedPositioned(
                duration: Duration(milliseconds: 350),
                bottom: controller.hideInput ? 0 : -50,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WRGAvatar(
                              imgSrc: controller.infoService.isSignedIn.value
                                  ? controller.apis.userInfo.value.userImageUrl
                                  : "",
                              size: 30,
                            ),
                            Container(
                              height: 47,
                              width: Get.width - 120,
                              child: TextField(
                                onEditingComplete: () {
                                  print("editing completed");
                                  controller.fn.unfocus();
                                },
                                focusNode: controller.fn,
                                controller: controller.textEditingController,
                                decoration: InputDecoration(
                                    hintText: "Place your comment",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 12),
                                    enabledBorder: InputBorder.none),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade100),
                            ),
                            InkWell(
                                onTap: () {},
                                child: Container(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.send)))
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            Text("is an Offer?")
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        );
      },
      onEmpty: emptySvg(),
      onError: (error) => Container(),
      onLoading: loadingSvg(),
    );
  }

  Widget inputWidget() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WRGAvatar(
                  imgSrc: controller.infoService.isSignedIn.value
                      ? controller.apis.userInfo.value.userImageUrl
                      : "",
                  size: 30,
                ),
                Container(
                  height: 47,
                  width: Get.width - 120,
                  child: TextField(
                    controller: controller.textEditingController,
                    decoration: InputDecoration(
                        hintText: "Place your comment",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        enabledBorder: InputBorder.none),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100),
                ),
                InkWell(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.all(4), child: Icon(Icons.send)))
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Text("is an Offer?")
              ],
            ),
          )
        ],
      ),
    );
  }
}
