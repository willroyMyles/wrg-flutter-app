import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/fontend/pages/conversation/state.conversation.dart';

class ConversationSection extends StatelessWidget {
  var controller = Get.put(ConversationState());
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return Container(
          width: Get.width,
          height: 300,
          color: Colors.green,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...controller.map.values.map((value) {
                  return Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                    child: Texxt("hello").h3(),
                  );
                }).toList()
              ],
            ),
          ),
        );
      },
      onEmpty: emptySvg(),
      onLoading: loadingSvg(),
      onError: (error) => Container(child: Texxt("error").huge()),
    );
  }
}
