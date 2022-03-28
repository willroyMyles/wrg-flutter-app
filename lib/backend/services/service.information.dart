import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/messages.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/models/post.model.dart';

class RxObject<T> extends Rx<Map<dynamic, dynamic>> {
  RxObject(Map initial) : super(initial);

  set(List<dynamic> list) {
    this.value.clear();
    for (var item in list) {
      this.value.update(
            item.id,
            (value) => item,
            ifAbsent: () => item,
          );
    }
    this.announce();
  }

  void updateMap(dynamic model) {
    if (!this.value.containsKey(model.id)) {
      this.value.putIfAbsent(model.id, () => model);
    }
    this.refresh();
  }

  clear() {
    this.value.clear();
    this.announce();
  }

  announce() => this.refresh();
}

class InformationService extends GetxController {
  RxMap<dynamic, dynamic> conversations = {}.obs;
  RxObject<OfferModel> offers = RxObject({});
  RxMap<dynamic, dynamic> watching = {}.obs;
  Rx<Map<dynamic, dynamic>> feed = Rx({});
  RxObject<PostModel> processed = RxObject({});
  RxMap<dynamic, dynamic> messages = {}.obs;
  RxBool isSignedIn = false.obs;
  RxBool isFabVisible = false.obs;

  clearAll() {
    conversations.clear();
    watching.clear();
    feed.value.clear();
    processed.value.clear();
    messages.clear();
    offers.clear();
    announceAll();
  }

  announceAll() {
    conversations.refresh();
    watching.refresh();
    feed.refresh();
    offers.announce();
    messages.refresh();
    processed.announce();
    refresh();
  }

  updateFab(bool val) {
    isFabVisible.value = val;
    isFabVisible.refresh();
  }

  setIsSIgnedIn(bool value) {
    isSignedIn.value = value;
    isSignedIn.refresh();
    isSignedIn.subject.add(value);
    if (!value) clearAll();
  }

  setConversation(List<dynamic> list) {
    for (var item in list) {
      conversations.putIfAbsent(item.id, () => item);
    }
    conversations.refresh();
  }

  updateConversation(ConversationModel model) {
    conversations.update(
      model.id,
      (value) => model,
      ifAbsent: () {
        Map<String, ConversationModel> map = {};
        map.putIfAbsent(model.id, () => model);
        return map;
      },
    );
    conversations.refresh();
  }

  setOffer(List<dynamic> list) {
    offers.set(list);
  }

  updateOffer(OfferModel model) {
    offers.updateMap(model);
  }

  setMessages(List<dynamic> list, String id) {
    messages.update(
      id,
      (value) => [...value, ...list].obs,
      ifAbsent: () {
        RxList<dynamic> list1 = list.obs;
        return list1;
      },
    );
    if (list.length != 0) messages.refresh();
  }

  updateMessages(MessagesModel model, String id) {
    if (messages.containsKey(id)) {
      messages[id].add(model);
      messages.refresh();
    } else {
      messages.putIfAbsent(id, () => [model].obs);
      messages.refresh();
    }
  }

  setWatching(List<dynamic> list) {
    for (var item in list) {
      watching.putIfAbsent(item.id, () => item);
    }
    watching.refresh();
  }

  modifyWatching(PostModel p, {add = true}) {
    if (!watching.containsKey(p.id) && add)
      watching.putIfAbsent(p.id as dynamic, () => p);
    else
      watching.removeWhere((key, value) => key == p.id);
    watching.refresh();
  }

  setFeed(List<dynamic> list) {
    for (var item in list) {
      feed.value.update(
        item.id,
        (value) => item,
        ifAbsent: () => item,
      );
    }
    feed.refresh();
  }

  addToFeed(PostModel p) {
    if (!feed.value.containsKey(p.id)) {
      feed.value.putIfAbsent(p.id, () => p);
    }
    feed.refresh();
  }
}
