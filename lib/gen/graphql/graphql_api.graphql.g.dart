// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMessageToConversation$Mutation _$AddMessageToConversation$MutationFromJson(
    Map<String, dynamic> json) {
  return AddMessageToConversation$Mutation()
    ..addMessageToConversation = json['addMessageToConversation'] as bool;
}

Map<String, dynamic> _$AddMessageToConversation$MutationToJson(
        AddMessageToConversation$Mutation instance) =>
    <String, dynamic>{
      'addMessageToConversation': instance.addMessageToConversation,
    };

AddMessageToConversationInput _$AddMessageToConversationInputFromJson(
    Map<String, dynamic> json) {
  return AddMessageToConversationInput(
    id: json['id'] as String,
    message: json['message'] == null
        ? null
        : CreateMessageInput.fromJson(json['message'] as Map<String, dynamic>),
    newMessage: json['newMessage'] as String,
  );
}

Map<String, dynamic> _$AddMessageToConversationInputToJson(
        AddMessageToConversationInput instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message?.toJson(),
      'newMessage': instance.newMessage,
    };

CreateMessageInput _$CreateMessageInputFromJson(Map<String, dynamic> json) {
  return CreateMessageInput(
    content: json['content'] as String,
    conversationId: json['conversationId'] as String,
    sender: json['sender'] as String,
  );
}

Map<String, dynamic> _$CreateMessageInputToJson(CreateMessageInput instance) =>
    <String, dynamic>{
      'content': instance.content,
      'conversationId': instance.conversationId,
      'sender': instance.sender,
    };

ModifyWatching$Mutation _$ModifyWatching$MutationFromJson(
    Map<String, dynamic> json) {
  return ModifyWatching$Mutation()
    ..modifyWatching = json['modifyWatching'] as bool;
}

Map<String, dynamic> _$ModifyWatching$MutationToJson(
        ModifyWatching$Mutation instance) =>
    <String, dynamic>{
      'modifyWatching': instance.modifyWatching,
    };

AddPostToWatchArgs _$AddPostToWatchArgsFromJson(Map<String, dynamic> json) {
  return AddPostToWatchArgs(
    add: json['add'] as bool,
    postId: json['postId'] as String,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$AddPostToWatchArgsToJson(AddPostToWatchArgs instance) =>
    <String, dynamic>{
      'add': instance.add,
      'postId': instance.postId,
      'userId': instance.userId,
    };

GetPosts$Query$GetPosts$UserInfo _$GetPosts$Query$GetPosts$UserInfoFromJson(
    Map<String, dynamic> json) {
  return GetPosts$Query$GetPosts$UserInfo()
    ..id = json['id'] as String
    ..userId = json['userId'] as String
    ..userImageUrl = json['userImageUrl'] as String
    ..username = json['username'] as String;
}

Map<String, dynamic> _$GetPosts$Query$GetPosts$UserInfoToJson(
        GetPosts$Query$GetPosts$UserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userImageUrl': instance.userImageUrl,
      'username': instance.username,
    };

GetPosts$Query$GetPosts _$GetPosts$Query$GetPostsFromJson(
    Map<String, dynamic> json) {
  return GetPosts$Query$GetPosts()
    ..id = json['id'] as String
    ..category = json['category'] as String
    ..content = json['content'] as String
    ..make = json['make'] as String
    ..model = json['model'] as String
    ..year = json['year'] as int
    ..views = json['views'] as int
    ..title = json['title'] as String
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String)
    ..userInfo = json['userInfo'] == null
        ? null
        : GetPosts$Query$GetPosts$UserInfo.fromJson(
            json['userInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetPosts$Query$GetPostsToJson(
        GetPosts$Query$GetPosts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'content': instance.content,
      'make': instance.make,
      'model': instance.model,
      'year': instance.year,
      'views': instance.views,
      'title': instance.title,
      'createdAt': instance.createdAt?.toIso8601String(),
      'userInfo': instance.userInfo?.toJson(),
    };

GetPosts$Query _$GetPosts$QueryFromJson(Map<String, dynamic> json) {
  return GetPosts$Query()
    ..getPosts = (json['getPosts'] as List)
        ?.map((e) => e == null
            ? null
            : GetPosts$Query$GetPosts.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetPosts$QueryToJson(GetPosts$Query instance) =>
    <String, dynamic>{
      'getPosts': instance.getPosts?.map((e) => e?.toJson())?.toList(),
    };

CreateComment$Mutation$CreateComment
    _$CreateComment$Mutation$CreateCommentFromJson(Map<String, dynamic> json) {
  return CreateComment$Mutation$CreateComment()..id = json['id'] as String;
}

Map<String, dynamic> _$CreateComment$Mutation$CreateCommentToJson(
        CreateComment$Mutation$CreateComment instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateComment$Mutation _$CreateComment$MutationFromJson(
    Map<String, dynamic> json) {
  return CreateComment$Mutation()
    ..createComment = json['createComment'] == null
        ? null
        : CreateComment$Mutation$CreateComment.fromJson(
            json['createComment'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateComment$MutationToJson(
        CreateComment$Mutation instance) =>
    <String, dynamic>{
      'createComment': instance.createComment?.toJson(),
    };

CreateCommentInput _$CreateCommentInputFromJson(Map<String, dynamic> json) {
  return CreateCommentInput(
    content: json['content'] as String,
    isOffer: json['isOffer'] as bool,
    postId: json['postId'] as String,
    title: json['title'] as String,
    userId: json['userId'] as String,
    userImageUrl: json['userImageUrl'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$CreateCommentInputToJson(CreateCommentInput instance) =>
    <String, dynamic>{
      'content': instance.content,
      'isOffer': instance.isOffer,
      'postId': instance.postId,
      'title': instance.title,
      'userId': instance.userId,
      'userImageUrl': instance.userImageUrl,
      'username': instance.username,
    };

GetCommentsByPostId$Query$GetCommentsByPostId
    _$GetCommentsByPostId$Query$GetCommentsByPostIdFromJson(
        Map<String, dynamic> json) {
  return GetCommentsByPostId$Query$GetCommentsByPostId()
    ..content = json['content'] as String
    ..id = json['id'] as String
    ..isOffer = json['isOffer'] as bool
    ..postId = json['postId'] as String
    ..userId = json['userId'] as String
    ..userImageUrl = json['userImageUrl'] as String
    ..username = json['username'] as String
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String);
}

Map<String, dynamic> _$GetCommentsByPostId$Query$GetCommentsByPostIdToJson(
        GetCommentsByPostId$Query$GetCommentsByPostId instance) =>
    <String, dynamic>{
      'content': instance.content,
      'id': instance.id,
      'isOffer': instance.isOffer,
      'postId': instance.postId,
      'userId': instance.userId,
      'userImageUrl': instance.userImageUrl,
      'username': instance.username,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

GetCommentsByPostId$Query _$GetCommentsByPostId$QueryFromJson(
    Map<String, dynamic> json) {
  return GetCommentsByPostId$Query()
    ..getCommentsByPostId = (json['getCommentsByPostId'] as List)
        ?.map((e) => e == null
            ? null
            : GetCommentsByPostId$Query$GetCommentsByPostId.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetCommentsByPostId$QueryToJson(
        GetCommentsByPostId$Query instance) =>
    <String, dynamic>{
      'getCommentsByPostId':
          instance.getCommentsByPostId?.map((e) => e?.toJson())?.toList(),
    };

CreateUserInfo$Mutation$CreateUserInfo
    _$CreateUserInfo$Mutation$CreateUserInfoFromJson(
        Map<String, dynamic> json) {
  return CreateUserInfo$Mutation$CreateUserInfo()
    ..userId = json['userId'] as String
    ..id = json['id'] as String
    ..userImageUrl = json['userImageUrl'] as String
    ..username = json['username'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic> _$CreateUserInfo$Mutation$CreateUserInfoToJson(
        CreateUserInfo$Mutation$CreateUserInfo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'userImageUrl': instance.userImageUrl,
      'username': instance.username,
      'email': instance.email,
    };

CreateUserInfo$Mutation _$CreateUserInfo$MutationFromJson(
    Map<String, dynamic> json) {
  return CreateUserInfo$Mutation()
    ..createUserInfo = json['createUserInfo'] == null
        ? null
        : CreateUserInfo$Mutation$CreateUserInfo.fromJson(
            json['createUserInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateUserInfo$MutationToJson(
        CreateUserInfo$Mutation instance) =>
    <String, dynamic>{
      'createUserInfo': instance.createUserInfo?.toJson(),
    };

CreateUserInfoArgs _$CreateUserInfoArgsFromJson(Map<String, dynamic> json) {
  return CreateUserInfoArgs(
    alias: json['alias'] as String,
    email: json['email'] as String,
    userId: json['userId'] as String,
    userImageUrl: json['userImageUrl'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$CreateUserInfoArgsToJson(CreateUserInfoArgs instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'email': instance.email,
      'userId': instance.userId,
      'userImageUrl': instance.userImageUrl,
      'username': instance.username,
    };

CreateConversation$Mutation$CreateConversation
    _$CreateConversation$Mutation$CreateConversationFromJson(
        Map<String, dynamic> json) {
  return CreateConversation$Mutation$CreateConversation()
    ..id = json['id'] as String;
}

Map<String, dynamic> _$CreateConversation$Mutation$CreateConversationToJson(
        CreateConversation$Mutation$CreateConversation instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateConversation$Mutation _$CreateConversation$MutationFromJson(
    Map<String, dynamic> json) {
  return CreateConversation$Mutation()
    ..createConversation = json['createConversation'] == null
        ? null
        : CreateConversation$Mutation$CreateConversation.fromJson(
            json['createConversation'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateConversation$MutationToJson(
        CreateConversation$Mutation instance) =>
    <String, dynamic>{
      'createConversation': instance.createConversation?.toJson(),
    };

CreateConversationInput _$CreateConversationInputFromJson(
    Map<String, dynamic> json) {
  return CreateConversationInput(
    commentId: json['commentId'] as String,
    locked: json['locked'] as bool,
    messages: (json['messages'] as List)
        ?.map((e) => e == null
            ? null
            : CreateMessageInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    postId: json['postId'] as String,
    recieverId: json['recieverId'] as String,
    senderId: json['senderId'] as String,
    userInfoId: json['userInfoId'] as String,
  );
}

Map<String, dynamic> _$CreateConversationInputToJson(
        CreateConversationInput instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'locked': instance.locked,
      'messages': instance.messages?.map((e) => e?.toJson())?.toList(),
      'postId': instance.postId,
      'recieverId': instance.recieverId,
      'senderId': instance.senderId,
      'userInfoId': instance.userInfoId,
    };

GetConversations$Query$GetConversationsByUserInfo$Incomings
    _$GetConversations$Query$GetConversationsByUserInfo$IncomingsFromJson(
        Map<String, dynamic> json) {
  return GetConversations$Query$GetConversationsByUserInfo$Incomings()
    ..comment = json['comment'] == null
        ? null
        : ConvoMixin$Comment.fromJson(json['comment'] as Map<String, dynamic>)
    ..id = json['id'] as String
    ..newMessage = json['newMessage'] as String
    ..locked = json['locked'] as bool
    ..post = json['post'] == null
        ? null
        : ConvoMixin$Post.fromJson(json['post'] as Map<String, dynamic>)
    ..messages = (json['messages'] as List)
        ?.map((e) => e == null
            ? null
            : ConvoMixin$Messages.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..reciever = json['reciever'] == null
        ? null
        : ConvoMixin$Reciever.fromJson(json['reciever'] as Map<String, dynamic>)
    ..sender = json['sender'] == null
        ? null
        : ConvoMixin$Sender.fromJson(json['sender'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$GetConversations$Query$GetConversationsByUserInfo$IncomingsToJson(
            GetConversations$Query$GetConversationsByUserInfo$Incomings
                instance) =>
        <String, dynamic>{
          'comment': instance.comment?.toJson(),
          'id': instance.id,
          'newMessage': instance.newMessage,
          'locked': instance.locked,
          'post': instance.post?.toJson(),
          'messages': instance.messages?.map((e) => e?.toJson())?.toList(),
          'reciever': instance.reciever?.toJson(),
          'sender': instance.sender?.toJson(),
        };

GetConversations$Query$GetConversationsByUserInfo$Outgoings
    _$GetConversations$Query$GetConversationsByUserInfo$OutgoingsFromJson(
        Map<String, dynamic> json) {
  return GetConversations$Query$GetConversationsByUserInfo$Outgoings()
    ..comment = json['comment'] == null
        ? null
        : ConvoMixin$Comment.fromJson(json['comment'] as Map<String, dynamic>)
    ..id = json['id'] as String
    ..newMessage = json['newMessage'] as String
    ..locked = json['locked'] as bool
    ..post = json['post'] == null
        ? null
        : ConvoMixin$Post.fromJson(json['post'] as Map<String, dynamic>)
    ..messages = (json['messages'] as List)
        ?.map((e) => e == null
            ? null
            : ConvoMixin$Messages.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..reciever = json['reciever'] == null
        ? null
        : ConvoMixin$Reciever.fromJson(json['reciever'] as Map<String, dynamic>)
    ..sender = json['sender'] == null
        ? null
        : ConvoMixin$Sender.fromJson(json['sender'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$GetConversations$Query$GetConversationsByUserInfo$OutgoingsToJson(
            GetConversations$Query$GetConversationsByUserInfo$Outgoings
                instance) =>
        <String, dynamic>{
          'comment': instance.comment?.toJson(),
          'id': instance.id,
          'newMessage': instance.newMessage,
          'locked': instance.locked,
          'post': instance.post?.toJson(),
          'messages': instance.messages?.map((e) => e?.toJson())?.toList(),
          'reciever': instance.reciever?.toJson(),
          'sender': instance.sender?.toJson(),
        };

GetConversations$Query$GetConversationsByUserInfo
    _$GetConversations$Query$GetConversationsByUserInfoFromJson(
        Map<String, dynamic> json) {
  return GetConversations$Query$GetConversationsByUserInfo()
    ..incomings = (json['incomings'] as List)
        ?.map((e) => e == null
            ? null
            : GetConversations$Query$GetConversationsByUserInfo$Incomings
                .fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..outgoings = (json['outgoings'] as List)
        ?.map((e) => e == null
            ? null
            : GetConversations$Query$GetConversationsByUserInfo$Outgoings
                .fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..id = json['id'] as String;
}

Map<String, dynamic> _$GetConversations$Query$GetConversationsByUserInfoToJson(
        GetConversations$Query$GetConversationsByUserInfo instance) =>
    <String, dynamic>{
      'incomings': instance.incomings?.map((e) => e?.toJson())?.toList(),
      'outgoings': instance.outgoings?.map((e) => e?.toJson())?.toList(),
      'id': instance.id,
    };

GetConversations$Query _$GetConversations$QueryFromJson(
    Map<String, dynamic> json) {
  return GetConversations$Query()
    ..getConversationsByUserInfo = json['getConversationsByUserInfo'] == null
        ? null
        : GetConversations$Query$GetConversationsByUserInfo.fromJson(
            json['getConversationsByUserInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetConversations$QueryToJson(
        GetConversations$Query instance) =>
    <String, dynamic>{
      'getConversationsByUserInfo':
          instance.getConversationsByUserInfo?.toJson(),
    };

ConvoMixin$Comment _$ConvoMixin$CommentFromJson(Map<String, dynamic> json) {
  return ConvoMixin$Comment()
    ..content = json['content'] as String
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String);
}

Map<String, dynamic> _$ConvoMixin$CommentToJson(ConvoMixin$Comment instance) =>
    <String, dynamic>{
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

ConvoMixin$Post _$ConvoMixin$PostFromJson(Map<String, dynamic> json) {
  return ConvoMixin$Post()..id = json['id'] as String;
}

Map<String, dynamic> _$ConvoMixin$PostToJson(ConvoMixin$Post instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

ConvoMixin$Messages _$ConvoMixin$MessagesFromJson(Map<String, dynamic> json) {
  return ConvoMixin$Messages()
    ..content = json['content'] as String
    ..sender = json['sender'] as String
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String);
}

Map<String, dynamic> _$ConvoMixin$MessagesToJson(
        ConvoMixin$Messages instance) =>
    <String, dynamic>{
      'content': instance.content,
      'sender': instance.sender,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

ConvoMixin$Reciever _$ConvoMixin$RecieverFromJson(Map<String, dynamic> json) {
  return ConvoMixin$Reciever()
    ..username = json['username'] as String
    ..alias = json['alias'] as String
    ..id = json['id'] as String
    ..userImageUrl = json['userImageUrl'] as String;
}

Map<String, dynamic> _$ConvoMixin$RecieverToJson(
        ConvoMixin$Reciever instance) =>
    <String, dynamic>{
      'username': instance.username,
      'alias': instance.alias,
      'id': instance.id,
      'userImageUrl': instance.userImageUrl,
    };

ConvoMixin$Sender _$ConvoMixin$SenderFromJson(Map<String, dynamic> json) {
  return ConvoMixin$Sender()
    ..alias = json['alias'] as String
    ..username = json['username'] as String
    ..id = json['id'] as String
    ..userImageUrl = json['userImageUrl'] as String;
}

Map<String, dynamic> _$ConvoMixin$SenderToJson(ConvoMixin$Sender instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'username': instance.username,
      'id': instance.id,
      'userImageUrl': instance.userImageUrl,
    };

GetUserInfoByEmail$Query$GetUserInfoByEmail$Watching
    _$GetUserInfoByEmail$Query$GetUserInfoByEmail$WatchingFromJson(
        Map<String, dynamic> json) {
  return GetUserInfoByEmail$Query$GetUserInfoByEmail$Watching()
    ..id = json['id'] as String
    ..category = json['category'] as String
    ..content = json['content'] as String
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String)
    ..make = json['make'] as String
    ..model = json['model'] as String
    ..title = json['title'] as String
    ..userId = json['userId'] as String
    ..username = json['username'] as String
    ..userImageUrl = json['userImageUrl'] as String
    ..views = json['views'] as int
    ..year = json['year'] as int;
}

Map<String, dynamic>
    _$GetUserInfoByEmail$Query$GetUserInfoByEmail$WatchingToJson(
            GetUserInfoByEmail$Query$GetUserInfoByEmail$Watching instance) =>
        <String, dynamic>{
          'id': instance.id,
          'category': instance.category,
          'content': instance.content,
          'createdAt': instance.createdAt?.toIso8601String(),
          'make': instance.make,
          'model': instance.model,
          'title': instance.title,
          'userId': instance.userId,
          'username': instance.username,
          'userImageUrl': instance.userImageUrl,
          'views': instance.views,
          'year': instance.year,
        };

GetUserInfoByEmail$Query$GetUserInfoByEmail
    _$GetUserInfoByEmail$Query$GetUserInfoByEmailFromJson(
        Map<String, dynamic> json) {
  return GetUserInfoByEmail$Query$GetUserInfoByEmail()
    ..id = json['id'] as String
    ..username = json['username'] as String
    ..userId = json['userId'] as String
    ..email = json['email'] as String
    ..alias = json['alias'] as String
    ..userImageUrl = json['userImageUrl'] as String
    ..watching = (json['watching'] as List)
        ?.map((e) => e == null
            ? null
            : GetUserInfoByEmail$Query$GetUserInfoByEmail$Watching.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetUserInfoByEmail$Query$GetUserInfoByEmailToJson(
        GetUserInfoByEmail$Query$GetUserInfoByEmail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'userId': instance.userId,
      'email': instance.email,
      'alias': instance.alias,
      'userImageUrl': instance.userImageUrl,
      'watching': instance.watching?.map((e) => e?.toJson())?.toList(),
    };

GetUserInfoByEmail$Query _$GetUserInfoByEmail$QueryFromJson(
    Map<String, dynamic> json) {
  return GetUserInfoByEmail$Query()
    ..getUserInfoByEmail = json['getUserInfoByEmail'] == null
        ? null
        : GetUserInfoByEmail$Query$GetUserInfoByEmail.fromJson(
            json['getUserInfoByEmail'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetUserInfoByEmail$QueryToJson(
        GetUserInfoByEmail$Query instance) =>
    <String, dynamic>{
      'getUserInfoByEmail': instance.getUserInfoByEmail?.toJson(),
    };

CreatePost$Mutation$CreatePost _$CreatePost$Mutation$CreatePostFromJson(
    Map<String, dynamic> json) {
  return CreatePost$Mutation$CreatePost()
    ..id = json['id'] as String
    ..category = json['category'] as String
    ..content = json['content'] as String
    ..make = json['make'] as String
    ..model = json['model'] as String
    ..year = json['year'] as int
    ..views = json['views'] as int
    ..title = json['title'] as String;
}

Map<String, dynamic> _$CreatePost$Mutation$CreatePostToJson(
        CreatePost$Mutation$CreatePost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'content': instance.content,
      'make': instance.make,
      'model': instance.model,
      'year': instance.year,
      'views': instance.views,
      'title': instance.title,
    };

CreatePost$Mutation _$CreatePost$MutationFromJson(Map<String, dynamic> json) {
  return CreatePost$Mutation()
    ..createPost = json['createPost'] == null
        ? null
        : CreatePost$Mutation$CreatePost.fromJson(
            json['createPost'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreatePost$MutationToJson(
        CreatePost$Mutation instance) =>
    <String, dynamic>{
      'createPost': instance.createPost?.toJson(),
    };

CreatePostArgs _$CreatePostArgsFromJson(Map<String, dynamic> json) {
  return CreatePostArgs(
    category: json['category'] as String,
    content: json['content'] as String,
    make: json['make'] as String,
    model: json['model'] as String,
    title: json['title'] as String,
    userInfoId: json['userInfoId'] as String,
    views: (json['views'] as num)?.toDouble(),
    year: (json['year'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CreatePostArgsToJson(CreatePostArgs instance) =>
    <String, dynamic>{
      'category': instance.category,
      'content': instance.content,
      'make': instance.make,
      'model': instance.model,
      'title': instance.title,
      'userInfoId': instance.userInfoId,
      'views': instance.views,
      'year': instance.year,
    };

GetWatching$Query$GetWatching _$GetWatching$Query$GetWatchingFromJson(
    Map<String, dynamic> json) {
  return GetWatching$Query$GetWatching()
    ..id = json['id'] as String
    ..category = json['category'] as String
    ..content = json['content'] as String
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String)
    ..make = json['make'] as String
    ..model = json['model'] as String
    ..title = json['title'] as String
    ..userId = json['userId'] as String
    ..username = json['username'] as String
    ..userImageUrl = json['userImageUrl'] as String
    ..views = json['views'] as int
    ..year = json['year'] as int;
}

Map<String, dynamic> _$GetWatching$Query$GetWatchingToJson(
        GetWatching$Query$GetWatching instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'make': instance.make,
      'model': instance.model,
      'title': instance.title,
      'userId': instance.userId,
      'username': instance.username,
      'userImageUrl': instance.userImageUrl,
      'views': instance.views,
      'year': instance.year,
    };

GetWatching$Query _$GetWatching$QueryFromJson(Map<String, dynamic> json) {
  return GetWatching$Query()
    ..getWatching = (json['getWatching'] as List)
        ?.map((e) => e == null
            ? null
            : GetWatching$Query$GetWatching.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetWatching$QueryToJson(GetWatching$Query instance) =>
    <String, dynamic>{
      'getWatching': instance.getWatching?.map((e) => e?.toJson())?.toList(),
    };

AddMessageToConversationArguments _$AddMessageToConversationArgumentsFromJson(
    Map<String, dynamic> json) {
  return AddMessageToConversationArguments(
    messages: json['messages'] == null
        ? null
        : AddMessageToConversationInput.fromJson(
            json['messages'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddMessageToConversationArgumentsToJson(
        AddMessageToConversationArguments instance) =>
    <String, dynamic>{
      'messages': instance.messages?.toJson(),
    };

ModifyWatchingArguments _$ModifyWatchingArgumentsFromJson(
    Map<String, dynamic> json) {
  return ModifyWatchingArguments(
    input: json['input'] == null
        ? null
        : AddPostToWatchArgs.fromJson(json['input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModifyWatchingArgumentsToJson(
        ModifyWatchingArguments instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
    };

CreateCommentArguments _$CreateCommentArgumentsFromJson(
    Map<String, dynamic> json) {
  return CreateCommentArguments(
    input: json['input'] == null
        ? null
        : CreateCommentInput.fromJson(json['input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateCommentArgumentsToJson(
        CreateCommentArguments instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
    };

GetCommentsByPostIdArguments _$GetCommentsByPostIdArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetCommentsByPostIdArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$GetCommentsByPostIdArgumentsToJson(
        GetCommentsByPostIdArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateUserInfoArguments _$CreateUserInfoArgumentsFromJson(
    Map<String, dynamic> json) {
  return CreateUserInfoArguments(
    input: json['input'] == null
        ? null
        : CreateUserInfoArgs.fromJson(json['input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateUserInfoArgumentsToJson(
        CreateUserInfoArguments instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
    };

CreateConversationArguments _$CreateConversationArgumentsFromJson(
    Map<String, dynamic> json) {
  return CreateConversationArguments(
    convo: json['convo'] == null
        ? null
        : CreateConversationInput.fromJson(
            json['convo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateConversationArgumentsToJson(
        CreateConversationArguments instance) =>
    <String, dynamic>{
      'convo': instance.convo?.toJson(),
    };

GetConversationsArguments _$GetConversationsArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetConversationsArguments(
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$GetConversationsArgumentsToJson(
        GetConversationsArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

GetUserInfoByEmailArguments _$GetUserInfoByEmailArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetUserInfoByEmailArguments(
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$GetUserInfoByEmailArgumentsToJson(
        GetUserInfoByEmailArguments instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

CreatePostArguments _$CreatePostArgumentsFromJson(Map<String, dynamic> json) {
  return CreatePostArguments(
    postInput: json['postInput'] == null
        ? null
        : CreatePostArgs.fromJson(json['postInput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreatePostArgumentsToJson(
        CreatePostArguments instance) =>
    <String, dynamic>{
      'postInput': instance.postInput?.toJson(),
    };

GetWatchingArguments _$GetWatchingArgumentsFromJson(Map<String, dynamic> json) {
  return GetWatchingArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$GetWatchingArgumentsToJson(
        GetWatchingArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
