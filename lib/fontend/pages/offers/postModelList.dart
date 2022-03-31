import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/fontend/components/item.postOffers.dart';

class PostModelListState extends GetxController {
  int currentIndex = -1;

  updateExpanded(int index, bool expanded) {
    if (expanded) {
      currentIndex = -1;
    } else {
      currentIndex = index;
    }
    refresh();
    print("updated");
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
        title: Text("Offers"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(child: GetBuilder<PostModelListState>(builder: (con) {
          return ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              con.updateExpanded(panelIndex, isExpanded);
            },
            children: [
              ...models.entries.map((e) {
                var model = e.value
                    .where((element) => element.postId == e.key)
                    .first
                    .post;
                var index = models.keys.toList().indexOf(e.key);
                var selected = index == con.currentIndex;
                return ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return Container(
                        child: Text(model.title),
                      );
                    },
                    body: Container(
                      height: 100,
                      color: Colors.red,
                    ),
                    isExpanded: selected);
              }).toList()
            ],
          );
        })),
      ),
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
