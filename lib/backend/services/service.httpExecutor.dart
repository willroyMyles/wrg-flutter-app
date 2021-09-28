import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/messages.dart';
import 'package:wrg2/backend/models/modifyWatching.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/backend/services/service.auth.dart';
import 'package:wrg2/backend/services/service.baseExecutor.dart';
import 'package:wrg2/backend/services/service.information.dart';

import 'service.toast.dart';

class HttpExecutor extends GetxController with ApiAuth, BaseExecutor {
  var _informationService = Get.put(InformationService());
  var _toastService = Get.put(ToastService());
  bool updated = false;

  HttpExecutor() {
    auth.authStateChanges().listen((event) {
      if (event != null && !updated) {
        //get user info
        updated = true;
        getUserInfo(event);
      }
      if (event == null) {
        updated = false;
        _informationService.setIsSIgnedIn(false);
        userInfo.value = null;
        userInfo.refresh();
      }
    });
  }

  var userInfo = UserInfoModel.empty().obs;

  Future<bool> getPosts() async {
    try {
      var info = await findAll(post);
      if (info.statusCode == 200) {
        List<PostModel> list = [];
        for (var item in info.data) {
          var p = PostModel.fromMap(item);
          list.add(p);
        }

        _informationService.setFeed(list);
        return Future.value(true);
      }
      return Future.value(false);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  bool acceptable(status) {
    return status >= 200 && status <= 299;
  }

  Future<bool> createPost(PostModel input) async {
    try {
      // input.username = userInfo.value.username;
      // input.userId = userInfo.value.userId;
      // input.userImage = userInfo.value.userImageUrl;
      input.userInfoId = userInfo.value.userId;
      var info = await create(post, input.toMap());
      if (acceptable(info.statusCode)) {
        input.userInfo = userInfo.value;
        _informationService.addToFeed(input);
        return Future.value(true);
      }
      return Future.value(false);
    } catch (e) {
      return Future.value(false);
    }
  }

  createComment(CommentModel input) async {
    try {
      input.userId = userInfo.value.userId;
      input.username = userInfo.value.username;
      input.userImageUrl = userInfo.value.userImageUrl;

      var res = await create(commentUrl, input.toMap());
      if (acceptable(res.statusCode)) {
        PostModel p = _informationService.feed.values
            .firstWhere((element) => element.id == input.postId);
        p.commentss += 1;
        _informationService.feed.update(p.id, (value) => p);
        return Future.value(true);
      }
      return Future.value(false);
    } on DioError catch (e) {
      return Future.value(false);
    } on Error catch (er) {
      return Future.value(false);
    }
  }

  getWatchingPosts() {}

  Future<List<dynamic>> getCommentsForPost(String id) async {
    try {
      var res = await dio.get(
        "$baseUrl$commentUrl/post/$id",
      );
      if (acceptable(res.statusCode)) {
        return Future.value(res.data);
      }

      return Future.error("could not get comments");
    } catch (e) {
      print(e);
      return Future.error("could not get comments");
    }
  }

  modifyWatching(PostModel post, {bool add}) async {
    try {
      var mw = ModifyWatching();
      mw.add = add;
      mw.id = userInfo.value.userId;
      mw.post = post.id;
      var res = await dio.post("$baseUrl$userinfo/watching", data: mw.toMap());
      if (acceptable(res.statusCode)) {
        _informationService.modifyWatching(post, add: add);
        post.watching += add ? 1 : -1;
        _informationService.feed.update(post.id, (value) => post);
        return Future.value(true);
      }
      return Future.value(false);
    } catch (e) {
      printError(info: "could not modify watching");
      return Future.value(false);
    }
  }

  createConversation(ConversationModel conversation, PostModel post) async {
    try {
      conversation.senderId = userInfo.value.userId;
      conversation.recieverId = post.userInfoId;
      conversation.postId = post.id;
      var mm = conversation.messages.first;
      mm.sender = userInfo.value.userId;
      conversation.messages.clear();
      conversation.messages.add(mm);

      var ans = await create(convoUrl, conversation.toMap());
    } catch (e) {
      print(e);
    }
  }

  getConversations() async {
    try {
      // var res = await dio.post(path);
    } catch (e) {}
  }

  addMessageToConversation(ConversationModel model, MessagesModel msg) async {
    try {
      var res =
          await dio.post("$baseUrl$messageUrl/${model.id}", data: msg.toMap());
      if (acceptable(res.statusCode)) {
        return Future.value(true);
      }
      return Future.value(false);
    } catch (e) {
      return Future.value(false);
    }
  }

  void getUserInfo(User user) async {
    try {
      var info = await findOne(userinfo, user.uid);

      userInfo.value = UserInfoModel.fromMap(info.data);
      userInfo.refresh();
      _informationService.setIsSIgnedIn(true);
      _informationService.setWatching(userInfo.value.watching);
      _informationService.setConversation(
          [...userInfo.value.incomings, ...userInfo.value.outgoings]);
    } on DioError catch (e) {
      print(e);
      if (e.response.statusCode == HttpStatus.notFound) {
        await createUserInfo(user);
      }
    } on Exception catch (e) {
      print("Could not get user");
    }
  }

  createUserInfo(User user) async {
    try {
      var userinformation = UserInfoModel.empty();
      userinformation.email = user.email;
      userinformation.userId = user.uid;
      userinformation.userImageUrl = user.photoURL;
      userinformation.username = user.displayName;

      var info = await create(userinfo, userinformation.toMap());
      userInfo.value = UserInfoModel.fromMap(info.data);
      userInfo.refresh();
      _informationService.setIsSIgnedIn(true);
    } catch (e) {
      printError(info: "could not create user");
      return Future.value(false);
    }
  }

  incrimentView(String id) async {
    try {
      var res = await dio.patch("$baseUrl$post/view/$id");
      if (acceptable(res.statusCode)) return Future.value(true);
      return Future.value(false);
    } catch (e) {
      return Future.value(false);
    }
  }

  getMessages(String id) async {
    try {
      var res = await dio.get("$baseUrl$convoUrl/$id");
      if (acceptable(res.statusCode)) {
        ConversationModel model = _informationService.conversations[id];
        List<MessagesModel> list = [];
        for (var msg in res.data["messages"]) {
          var message = MessagesModel.fromMap(msg);
          list.add(message);
        }
        model.messages = list;
        _informationService.updateConversation(model);
      }
    } catch (e) {
      return Future.value(false);
    }
  }
}
