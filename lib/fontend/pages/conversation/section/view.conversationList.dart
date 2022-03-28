import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/item.conversation.dart';
import 'package:wrg2/fontend/pages/conversation/state.conversation.dart';
import 'package:wrg2/fontend/pages/conversation/view.conversation.dart';

class ConversationList extends StatelessWidget {
  final cs = Get.find<ConversationState>();
  final ts = Get.find<ServiceTheme>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(20.0),
                child: Text("Conversations").hint(),
              ),
              SizedBox(
                height: 10,
              ),
              // Text("search bar"),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 200),
                  itemCount: cs.map.values.length,
                  itemBuilder: (context, index) {
                    return ConversationItem(
                      model: cs.map.values.elementAt(index),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
