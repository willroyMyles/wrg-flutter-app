import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/fontend/components/item.post.dart';

import '../../../backend/services/service.constants.dart';
import '../../../backend/services/service.dialog.dart';
import '../../../backend/services/service.information.dart';
import '../../../backend/services/service.theme.dart';
import 'state.discover.dart';
import 'package:wrg2/backend/extensions/ext.dart';

class DiscoverSliver extends StatelessWidget {
  DiscoverSliver({Key key}) : super(key: key);

  final ts = Get.find<ServiceTheme>();
  final DiscoverState controller = Get.put(DiscoverState());
  final infoService = Get.find<InformationService>();
  final dialogService = Get.find<DialogService>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverState>(
      builder: (controller) {
        if (controller.status.isSuccess)
          return SliverList(
              delegate: SliverChildListDelegate([
            ...controller.front.values
                .map((e) => PostItem(
                      item: e,
                    ))
                .toList()
          ]));

        if (controller.status.isSuccess && controller.noMorePosts)
          SliverToBoxAdapter(
            child: AnimatedContainer(
              duration: Constants.durationLong,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 50, bottom: 60),
              child: Text("no more posts",
                  style: TextStyle(
                    color: ts.grey,
                    fontSize: 25,
                  )),
            ).fadeInUp(),
          );

        return SliverToBoxAdapter();
      },
    );
  }
}
