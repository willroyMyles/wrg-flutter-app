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
      backgroundColor: ts.grey1,
      body: SafeArea(
        child: Container(
          color: ts.white,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text("Offers"),
                backgroundColor: ts.grey1,
              ),
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
