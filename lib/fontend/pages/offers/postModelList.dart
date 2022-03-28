import 'package:flutter/material.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/fontend/components/item.postOffers.dart';

class PostModelList extends StatelessWidget {
  final Map<String, List<OfferModel>> models;
  PostModelList({Key key, this.models}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offers"),
        backgroundColor: ts.grey1,
      ),
      // backgroundColor: ts.grey1,
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            primary: false,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  ...models.entries.map((e) => PostOfferItem(
                        list: e.value,
                        postModelId: e.key,
                      ))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
