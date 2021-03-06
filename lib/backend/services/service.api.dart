import 'dart:convert';

import 'package:get/get.dart';
import 'package:wrg2/backend/enums/enum.post.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/messages.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/backend/services/service.httpExecutor.dart';
import 'package:wrg2/backend/services/service.slack.dart';
import 'package:wrg2/backend/services/service.websocket.dart';

class APIService extends GetxController with SlackExecutor {
  final websocketOps = WebSocketOperations();
  final _apiInterface = Get.put(HttpExecutor());
  HttpExecutor get interface => _apiInterface;
  Rx<UserInfoModel> get userInfo => _apiInterface.userInfo;

  /// 0 for gooogle
  /// 1 for facebook
  login(int provider) async {
    try {
      dynamic res;
      switch (provider) {
        case 0:
          var ans = await _apiInterface.signInWithGoogle();
          // var user = await _apiInterface.getUser(ans.user);
          // if (user.value == null || user.value.id == null) {
          //   return Future.value(false);
          // }
          break;
      }
      return res;
    } catch (err) {}
  }

  logout() {
    return _apiInterface.logout();
  }

  getCategories() {
    // return _apiInterface.getCategories();
  }

  Future<bool> getPosts({String lastId, int amount, Status status}) {
    if (status != null)
      return _apiInterface.getfilteredPosts(
          amount: amount, lastId: lastId, status: status);
    else
      return _apiInterface.getPosts(amount: amount, lastId: lastId);
  }

  Future<bool> getfilteredPosts({String lastId, int amount, Status status}) {
    return _apiInterface.getfilteredPosts(
        amount: amount, lastId: lastId, status: status);
  }

  createPost(PostModel input) {
    return _apiInterface.createPost(input);
  }

  createComment(CommentModel input) {
    return _apiInterface.createComment(input);
  }

  getWatchingPosts() {
    return _apiInterface.getWatchingPosts();
  }

  Future<List<CommentModel>> getComments(String id) async {
    List<dynamic> res = await _apiInterface.getCommentsForPost(id);
    List<CommentModel> models = [];
    try {
      for (var item in res) {
        CommentModel model = CommentModel.fromMap(item);
        models.add(model);
      }

      return Future.value(models);
    } catch (e) {
      print(e);
      return Future.value(models);
    }
  }

  modifyWatched(PostModel post, {bool add = true}) {
    return _apiInterface.modifyWatching(post, add: add);
  }

  createConversation(ConversationModel conversation, PostModel post) {
    return _apiInterface.createConversation(conversation, post);
  }

  getConversations() {
    return _apiInterface.getConversations();
  }

  addMessageToConversation(ConversationModel model, MessagesModel msg) {
    return _apiInterface.addMessageToConversation(model, msg);
  }

  incrimentView(String id) {
    return _apiInterface.incrimentView(id);
  }

  getMessages(String id) {
    return _apiInterface.getMessages(id);
  }

  createOffer(OfferModel model) {
    model.senderId = userInfo.value.userId;
    return _apiInterface.createOffer(model);
  }

  Future<List<PostModel>> getOffers() async {
    var res = await _apiInterface.getOffers(userInfo.value.userId);

    List<PostModel> list = [];

    try {
      for (var data in res) {
        PostModel model = PostModel.fromMap(data.data());
        list.add(model);
      }
    } catch (e) {
      print(e);
    }

    return Future.value(list);
  }

  Future<bool> getUserOffers() => _apiInterface.getUserOffers();
}
