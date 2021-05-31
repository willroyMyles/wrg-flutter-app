import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:wrg2/backend/services/service.constants.dart';
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
        return AnimatedContainer(
            duration: Duration(milliseconds: 1350),
            padding: EdgeInsets.only(top: 0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          child: GroupButton(
                            isRadio: true,
                            spacing: 10,
                            onSelected: (index, isSelected) =>
                                controller.updateSelected(index, isSelected),
                            buttons: ["all", "offers"],
                            selectedButtons: ["all"],
                            selectedColor: ts.pc,
                            borderRadius: BorderRadius.circular(10),
                            unselectedBorderColor: Colors.grey,
                            unselectedShadow: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
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
                  )
                ],
              ),
            ));
      },
      onEmpty: emptySvg(),
      onError: (error) => Container(),
      onLoading: loadingSvg(),
    );
  }
}
