import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/post.model.dart';

class InformationService extends GetxController {
  RxMap<dynamic, dynamic> conversations = {}.obs;
  RxMap<dynamic, dynamic> watching = {}.obs;
  RxMap<dynamic, dynamic> feed = {}.obs;
  RxBool isSignedIn = false.obs;

  clearAll() {
    conversations.clear();
    watching.clear();
    feed.clear();
    announceAll();
  }

  announceAll() {
    conversations.refresh();
    watching.refresh();
    feed.refresh();
    refresh();
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
    );
    conversations.refresh();
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
      feed.putIfAbsent(item.id, () => item);
    }
    feed.refresh();
  }

  addToFeed(PostModel p) {
    if (!feed.containsKey(p.id)) {
      feed.putIfAbsent(p.id, () => p);
    }
    feed.refresh();
  }
}
