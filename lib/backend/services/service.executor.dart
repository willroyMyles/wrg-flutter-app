import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as FB;
import 'package:get/get.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/backend/services/service.auth.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.slack.dart';
import 'package:wrg2/backend/services/service.toast.dart';

class ApiExecutor extends GetxController with ApiAuth {
  var _informationService = Get.put(InformationService());
  var _toastService = Get.put(ToastService());

  bool firstStart = true;

  ApiExecutor() {
    auth.authStateChanges().listen((event) {
      if (event == null) {
      } else {
        if (firstStart) {
          // getUser(event);
          firstStart = false;
          print("this is first start $firstStart");
        }
      }
    });
  }

  @override
  logout() {
    super.logout();
    firstStart = true;
    // removeUser();
    _informationService.setIsSIgnedIn(false);
  }

  var userInfo = UserInfoModel.empty().obs;

  Stream<FB.User> onAuthChanged() {
    return auth.authStateChanges();
  }

  @override
  Future<FB.UserCredential> signInWithGoogle() async {
    var cred = await super.signInWithGoogle();
    _informationService.setIsSIgnedIn(true);
    return Future.value(cred);
  }

  // @override
  // List<List<dynamic>> getCategories() {
  //   return processList();
  // }

  // _updateUserInfo(Map<String, dynamic> map) {
  //   userInfo.value = UserInfoModel.fromMap(map);
  //   _informationService.setWatching(userInfo.value.watching);
  //   userInfo.refresh();
  //   getConversations();
  //   refresh();
  //   print("updated user info");
  // }

  // Future<List<dynamic>> getPosts() async {
  //   try {
  //     var query = GetPostsQuery();
  //     var res = await clientArt.execute(query);

  //     List<PostModel> list = [];
  //     for (var item in res.data.getPosts) {
  //       var p = PostModel.fromMap(item.toJson());
  //       list.add(p);
  //     }

  //     _informationService.setFeed(list);
  //     return Future.value(list);
  //   } catch (err) {
  //     return Future.error(err);
  //   }
  // }

  // Future<Rx<UserInfoModel>> createUser(FB.User data) async {
  //   try {
  //     var query = CreateUserInfoMutation(
  //         variables: CreateUserInfoArguments(
  //             input: CreateUserInfoArgs(
  //                 alias: data.displayName,
  //                 email: data.email,
  //                 userId: data.uid,
  //                 userImageUrl: data.photoURL,
  //                 username: data.displayName)));

  //     var res = await clientArt.execute(query);
  //     if (res.data.createUserInfo != null) {
  //       _updateUserInfo(res.data.createUserInfo.toJson());
  //     }

  //     return Future.value(userInfo);
  //   } catch (err) {
  //     return Future.error(err);
  //   }
  // }

  // Future<Rx<UserInfoModel>> getUserInfo(FB.User user) async {
  //   try {
  //     var query = GetUserInfoByEmailQuery(
  //         variables: GetUserInfoByEmailArguments(email: user.email));
  //     var res = await clientArt.execute(query);

  //     if (res.data.getUserInfoByEmail.id != null) {
  //       _updateUserInfo(res.data.getUserInfoByEmail.toJson());
  //     } else
  //       throw "";
  //     return Future.value(userInfo);
  //   } catch (err) {
  //     print(err);
  //     return Future.value(null);
  //   } finally {}
  // }

  // Future<Rx<UserInfoModel>> getUser(FB.User user) async {
  //   if (userInfo.value != null && userInfo.value.email == user.email)
  //     return reutrnUserInfo();
  //   //get from database
  //   var res = await getUserInfo(user);

  //   if (res?.value != null) {
  //     _informationService.setIsSIgnedIn(true);
  //     return reutrnUserInfo();
  //   } else {
  //     await createUser(user);
  //     _informationService.setIsSIgnedIn(true);
  //     return reutrnUserInfo();
  //   }
  // }

  // Future<Rx<UserInfoModel>> reutrnUserInfo() {
  //   _informationService.setIsSIgnedIn(true);
  //   _toastService.success("Signed in successfully");
  //   return Future.value(userInfo);
  // }

  // Future<bool> createPost(PostModel i) async {
  //   try {
  //     var query = CreatePostMutation(
  //         variables: CreatePostArguments(
  //       postInput: CreatePostArgs(
  //           category: i.category,
  //           content: i.content,
  //           make: i.make,
  //           model: i.model,
  //           userInfoId: userInfo.value.id,
  //           title: i.title,
  //           views: i.views * 1.0,
  //           year: i.year * 1.0),
  //     ));
  //     var res = await clientArt.execute(query);
  //     if (res.hasErrors) {}
  //     if (res.data.createPost.id != null) {
  //       i.userInfo = userInfo.value;
  //       _informationService.addToFeed(i);
  //     }
  //     return Future.value(true);
  //   } catch (err) {
  //     print(err);
  //     return Future.value(false);
  //     // return Future.error(err);
  //   }
  // }

  // void removeUser() {
  //   userInfo = UserInfoModel.empty().obs;
  //   userInfo.refresh();
  //   refresh();
  // }

  // Future<dynamic> createComment(CommentModel input) async {
  //   try {
  //     var query = CreateCommentMutation(
  //         variables: CreateCommentArguments(
  //             input: CreateCommentInput(
  //                 content: input.content,
  //                 postId: input.postId,
  //                 title: "",
  //                 isOffer: input.isOffer,
  //                 userId: userInfo.value.id,
  //                 userImageUrl: userInfo.value.userImageUrl,
  //                 username: userInfo.value.username)));
  //     var res = await clientArt.execute(query);
  //     return Future.value(res.data.createComment.id);
  //   } catch (err) {
  //     print(err);
  //     return Future.error("could not create comment");
  //   }
  // }

  // Future<List<CommentModel>> getCommentsForPost(String postId) async {
  //   try {
  //     var query = GetCommentsByPostIdQuery(
  //         variables: GetCommentsByPostIdArguments(id: postId));

  //     var res = await clientArt.execute(query);
  //     List<CommentModel> list = [];
  //     for (var item in res.data.getCommentsByPostId) {
  //       var com = CommentModel.fromMap(item.toJson());
  //       list.add(com);
  //     }
  //     return Future.value(list);
  //   } catch (err) {
  //     return Future.error("could not retrieve comments");
  //   }
  // }

  // Future<bool> modifyWatching(PostModel post, {bool add}) async {
  //   try {
  //     var query = ModifyWatchingMutation(
  //         variables: ModifyWatchingArguments(
  //             input: AddPostToWatchArgs(
  //                 postId: post.id, userId: userInfo.value.id, add: add)));
  //     // ignore: unused_local_variable
  //     var res = await clientArt.execute(query);

  //     _informationService.modifyWatching(post, add: add);

  //     return Future.value(true);
  //   } catch (e) {
  //     return Future.error(e);
  //   }
  // }

  // Future<List<PostModel>> getWatchingPosts() async {
  //   try {
  //     var query = GetWatchingQuery(
  //         variables: GetWatchingArguments(id: userInfo.value.id));
  //     var res = await clientArt.execute(query);
  //     List<PostModel> list = [];
  //     for (var item in res.data.getWatching) {
  //       var p = PostModel.fromMapWithoutUserinfo(item.toJson());
  //       list.add(p);
  //       userInfo.value.addToWatching(p);
  //     }
  //     _informationService.setWatching(list);
  //     return Future.value(list);
  //   } catch (e) {
  //     return Future.value([]);
  //   }
  // }

  // Future<bool> createConversation(
  //     ConversationModel conversation, PostModel post) async {
  //   try {
  //     var query = CreateConversationMutation(
  //         variables: CreateConversationArguments(
  //             convo: CreateConversationInput(
  //                 messages: [
  //           CreateMessageInput(
  //             content: conversation.messages.first.content,
  //             sender: userInfo.value.id,
  //           )
  //         ],
  //                 commentId: conversation.comment.id,
  //                 locked: false,
  //                 postId: post.id,
  //                 recieverId: conversation.comment.userId,
  //                 userInfoId: userInfo.value.id,
  //                 senderId: userInfo.value.id)));

  //     var res = await clientArt.execute(query);
  //     if (!res.hasErrors)
  //       return Future.value(true);
  //     else
  //       return Future.value(false);
  //   } catch (e) {
  //     print(e);
  //     return Future.value(false);
  //   }
  // }

  // Future<List<ConversationModel>> getConversations() async {
  //   try {
  //     var query = GetConversationsQuery(
  //         variables: GetConversationsArguments(userId: userInfo.value.id));

  //     var res = await clientArt.execute(query);

  //     if (res.hasErrors) {
  //       print(res.errors);
  //       _informationService.setConversation([]);
  //       return Future.value([]);
  //     }

  //     List<ConversationModel> list = [];
  //     List<dynamic> listOfConvos = [
  //       ...res.data.getConversationsByUserInfo.incomings,
  //       ...res.data.getConversationsByUserInfo.outgoings
  //     ];

  //     for (var item in listOfConvos) {
  //       var value = ConversationModel.fromMap(item.toJson());
  //       list.add(value);
  //     }

  //     _informationService.setConversation(list);

  //     return Future.value(list);
  //   } catch (err) {
  //     print(err);
  //     _informationService.setConversation([]);
  //     return Future.error("could noe get conversations");
  //   }
  // }

  // Future<bool> addMessageToConversation(ConversationModel model) async {
  //   try {
  //     // var msg = await this.createMessage(model.messages.last);
  //     var query = AddMessageToConversationMutation(
  //         variables: AddMessageToConversationArguments(
  //             messages: AddMessageToConversationInput(
  //                 id: model.id,
  //                 newMessage: model.getOthersId(),
  //                 message: CreateMessageInput(
  //                     content: model.messages.last.content,
  //                     conversationId: model.id,
  //                     sender: userInfo.value.id))));

  //     var res = await clientArt.execute(query);
  //     if (res.hasErrors) {
  //       throw res.errors;
  //     }

  //     _informationService.updateConversation(model);

  //     return Future.value(true);
  //   } catch (err) {
  //     print(err);
  //     return Future.error("could not add message");
  //   }
  // }
}
