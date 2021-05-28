import 'package:get/get.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/backend/services/service.executor.dart';

class APIService extends GetxController {
  ApiExecutor _apiInterface = Get.put(ApiExecutor());
  ApiExecutor get interface => _apiInterface;
  Rx<UserInfoModel> get userInfo => _apiInterface.userInfo;

  /// 0 for gooogle
  /// 1 for facebook
  login(int provider) async {
    try {
      dynamic res;
      switch (provider) {
        case 0:
          var ans = await _apiInterface.signInWithGoogle();
          _apiInterface.getUser(ans.user);
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

  getPosts() {
    return _apiInterface.getPosts();
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

  getComments(String id) {
    return _apiInterface.getCommentsForPost(id);
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

  addMessageToConversation(ConversationModel model) {
    return _apiInterface.addMessageToConversation(model);
  }
}
