import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/item.post.dart';
import 'package:wrg2/fontend/pages/discover/state.discover.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover>
    with AutomaticKeepAliveClientMixin {
  final ts = Get.find<ServiceTheme>();
  final DiscoverState controller = Get.put(DiscoverState());

  @override
  Widget build(BuildContext context) {
    print("building discover");
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          bottom: 60,
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: Container(
            child: Icon(
              Icons.add,
              color: ts.fgt.value,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          Container(
            child: Icon(
              Icons.search,
              color: ts.fgt.value,
            ),
          ),
        ],
      ),
      body: InkWell(
        onTap: controller.onTap(),
        child: Container(
            width: Get.width,
            alignment: Alignment.center,
            child: controller.obx(
              (state) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return PostItem(
                        item: controller.map.values.elementAt(index),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: controller.map.length);
              },
              onEmpty: InkWell(
                  onTap: () => controller.getMorePosts(), child: emptySvg()),
              onError: (err) => Container(
                color: Colors.green,
                child: Text("error"),
              ),
              onLoading: Container(
                child: Text("loading"),
              ),
            )),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
