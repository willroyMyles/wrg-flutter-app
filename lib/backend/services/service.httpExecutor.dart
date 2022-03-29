import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/enums/enum.post.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/messages.dart';
import 'package:wrg2/backend/models/modifyWatching.dart';
import 'package:wrg2/backend/models/offer.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/backend/services/offer%20service/offer.service.dart';
import 'package:wrg2/backend/services/service.auth.dart';
import 'package:wrg2/backend/services/service.baseExecutor.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.websocket.dart';

import 'service.toast.dart';

class HttpExecutor extends GetxController
    with BaseExecutor, OfferService, ApiAuth {
  var _informationService = Get.put(InformationService());
  var _toastService = Get.put(ToastService());
  bool updated = false;

  HttpExecutor() {
    // auth = FirebaseAuth.instance;
    // auth.authStateChanges().listen((event) {
    //   if (event != null && !updated) {
    //     //get user info
    //     updated = true;
    //     getUserInfo(event);
    //   }
    //   if (event == null) {
    //     updated = false;
    //     _informationService.setIsSIgnedIn(false);
    //     userInfo.value = null;
    //     userInfo.refresh();
    //   }
    // });

    silentlyGetUserInfo();
  }

  var userInfo = UserInfoModel.empty().obs;

  Future<bool> getPosts({String lastId, int amount}) async {
    try {
      var info = await dio.post("$baseUrl$post/posts",
          data: {"amount": amount, "lastId": lastId});
      if (acceptable(info.statusCode)) {
        if (info.data.length == 0) return Future.value(false);

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

  Future<bool> getfilteredPosts(
      {int amount, String lastId, Status status}) async {
    try {
      var info = await dio.post("$baseUrl$post/filter/$status",
          data: {"amount": amount, "lastId": lastId});
      if (acceptable(info.statusCode)) {
        if (info.data.length == 0) return Future.value(false);

        List<PostModel> list = [];
        for (var item in info.data) {
          var p = PostModel.fromMap(item);
          list.add(p);
        }

        _informationService.processed.set(list);
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
      input.offers = [];
      var map = input.toMap();
      var info = await create(post, map);
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
        PostModel p = _informationService.feed.value.values
            .firstWhere((element) => element.id == input.postId);
        p.commentss += 1;
        _informationService.feed.value.update(p.id, (value) => p);
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
        _informationService.feed.value.update(post.id, (value) => post);
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

  silentlyGetUserInfo() async {
    try {
      var info = await findOne(userinfo, "7lDbikBqXCZc6dBgsvp9nFcsuzu2");

      userInfo.value = UserInfoModel.fromMap(info.data);
      userInfo.refresh();
      _informationService.setIsSIgnedIn(true);
      _informationService.setWatching(userInfo.value.watching);
      _informationService.setConversation(
          [...userInfo.value.incomings, ...userInfo.value.outgoings]);
      getUserOffers();
    } on DioError catch (e) {
      print(e);
      if (e.response.statusCode == 404) {
        // await createUserInfo(user);
      }
    } on Exception catch (e) {
      print(e);
      print("Could not get user");
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
      getUserOffers();
    } on DioError catch (e) {
      print(e);
      if (e.response.statusCode == 404) {
        await createUserInfo(user);
      }
    } on Exception catch (e) {
      print(e);
      print("Could not get user");
    }
  }

  Future<bool> getUserOffers() async {
    try {
      var res = await getOffers(userInfo.value.userId);
      if (acceptable(res.statusCode)) {
        List<OfferModel> list = [];
        for (var data in res.data) {
          OfferModel model = OfferModel.fromMap(data);
          list.add(model);
        }

        _informationService.setOffer(list);
      }
      return Future.value(true);
    } on DioError catch (e) {
      print(e);
      return Future.value(false);
    } on Exception catch (e) {
      print(e);
      print("Could not get offers");
      return Future.value(false);
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
        ConversationModel model = ConversationModel.fromMap(res.data);
        _informationService.setMessages(model.messages, model.id);
        // _informationService.updateConversation(model);
        return Future.value(model.messages);
      }
    } on DioError catch (e) {
      print("dio error");
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }
}
