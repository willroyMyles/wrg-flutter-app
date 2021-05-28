// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

mixin ConvoMixin {
  ConvoMixin$Comment comment;
  String id;
  String newMessage;
  bool locked;
  ConvoMixin$Post post;
  List<ConvoMixin$Messages> messages;
  ConvoMixin$Reciever reciever;
  ConvoMixin$Sender sender;
}
mixin PMixin {
  String id;
  String category;
  String content;
  DateTime createdAt;
  String make;
  String model;
  String subCategory;
  String title;
  String userId;
  String username;
  String userImageUrl;
  int views;
  int year;
}

@JsonSerializable(explicitToJson: true)
class AddMessageToConversation$Mutation with EquatableMixin {
  AddMessageToConversation$Mutation();

  factory AddMessageToConversation$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$AddMessageToConversation$MutationFromJson(json);

  bool addMessageToConversation;

  @override
  List<Object> get props => [addMessageToConversation];
  Map<String, dynamic> toJson() =>
      _$AddMessageToConversation$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddMessageToConversationInput with EquatableMixin {
  AddMessageToConversationInput(
      {@required this.id, @required this.message, @required this.newMessage});

  factory AddMessageToConversationInput.fromJson(Map<String, dynamic> json) =>
      _$AddMessageToConversationInputFromJson(json);

  String id;

  CreateMessageInput message;

  String newMessage;

  @override
  List<Object> get props => [id, message, newMessage];
  Map<String, dynamic> toJson() => _$AddMessageToConversationInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateMessageInput with EquatableMixin {
  CreateMessageInput({this.content, this.conversationId, this.sender});

  factory CreateMessageInput.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageInputFromJson(json);

  String content;

  String conversationId;

  String sender;

  @override
  List<Object> get props => [content, conversationId, sender];
  Map<String, dynamic> toJson() => _$CreateMessageInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ModifyWatching$Mutation with EquatableMixin {
  ModifyWatching$Mutation();

  factory ModifyWatching$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ModifyWatching$MutationFromJson(json);

  bool modifyWatching;

  @override
  List<Object> get props => [modifyWatching];
  Map<String, dynamic> toJson() => _$ModifyWatching$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddPostToWatchArgs with EquatableMixin {
  AddPostToWatchArgs({this.add, @required this.postId, @required this.userId});

  factory AddPostToWatchArgs.fromJson(Map<String, dynamic> json) =>
      _$AddPostToWatchArgsFromJson(json);

  bool add;

  String postId;

  String userId;

  @override
  List<Object> get props => [add, postId, userId];
  Map<String, dynamic> toJson() => _$AddPostToWatchArgsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPosts$Query$GetPosts$UserInfo with EquatableMixin {
  GetPosts$Query$GetPosts$UserInfo();

  factory GetPosts$Query$GetPosts$UserInfo.fromJson(
          Map<String, dynamic> json) =>
      _$GetPosts$Query$GetPosts$UserInfoFromJson(json);

  String id;

  String userId;

  String userImageUrl;

  String username;

  @override
  List<Object> get props => [id, userId, userImageUrl, username];
  Map<String, dynamic> toJson() =>
      _$GetPosts$Query$GetPosts$UserInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPosts$Query$GetPosts with EquatableMixin {
  GetPosts$Query$GetPosts();

  factory GetPosts$Query$GetPosts.fromJson(Map<String, dynamic> json) =>
      _$GetPosts$Query$GetPostsFromJson(json);

  String id;

  String category;

  String subCategory;

  String content;

  String make;

  String model;

  int year;

  int views;

  String title;

  DateTime createdAt;

  GetPosts$Query$GetPosts$UserInfo userInfo;

  @override
  List<Object> get props => [
        id,
        category,
        subCategory,
        content,
        make,
        model,
        year,
        views,
        title,
        createdAt,
        userInfo
      ];
  Map<String, dynamic> toJson() => _$GetPosts$Query$GetPostsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPosts$Query with EquatableMixin {
  GetPosts$Query();

  factory GetPosts$Query.fromJson(Map<String, dynamic> json) =>
      _$GetPosts$QueryFromJson(json);

  List<GetPosts$Query$GetPosts> getPosts;

  @override
  List<Object> get props => [getPosts];
  Map<String, dynamic> toJson() => _$GetPosts$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateComment$Mutation$CreateComment with EquatableMixin {
  CreateComment$Mutation$CreateComment();

  factory CreateComment$Mutation$CreateComment.fromJson(
          Map<String, dynamic> json) =>
      _$CreateComment$Mutation$CreateCommentFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$CreateComment$Mutation$CreateCommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateComment$Mutation with EquatableMixin {
  CreateComment$Mutation();

  factory CreateComment$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateComment$MutationFromJson(json);

  CreateComment$Mutation$CreateComment createComment;

  @override
  List<Object> get props => [createComment];
  Map<String, dynamic> toJson() => _$CreateComment$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateCommentInput with EquatableMixin {
  CreateCommentInput(
      {this.content,
      @required this.isOffer,
      @required this.postId,
      this.title,
      this.userId,
      @required this.userImageUrl,
      this.username});

  factory CreateCommentInput.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentInputFromJson(json);

  String content;

  bool isOffer;

  String postId;

  String title;

  String userId;

  String userImageUrl;

  String username;

  @override
  List<Object> get props =>
      [content, isOffer, postId, title, userId, userImageUrl, username];
  Map<String, dynamic> toJson() => _$CreateCommentInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCommentsByPostId$Query$GetCommentsByPostId with EquatableMixin {
  GetCommentsByPostId$Query$GetCommentsByPostId();

  factory GetCommentsByPostId$Query$GetCommentsByPostId.fromJson(
          Map<String, dynamic> json) =>
      _$GetCommentsByPostId$Query$GetCommentsByPostIdFromJson(json);

  String content;

  String id;

  bool isOffer;

  String postId;

  String userId;

  String userImageUrl;

  String username;

  DateTime createdAt;

  @override
  List<Object> get props =>
      [content, id, isOffer, postId, userId, userImageUrl, username, createdAt];
  Map<String, dynamic> toJson() =>
      _$GetCommentsByPostId$Query$GetCommentsByPostIdToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCommentsByPostId$Query with EquatableMixin {
  GetCommentsByPostId$Query();

  factory GetCommentsByPostId$Query.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsByPostId$QueryFromJson(json);

  List<GetCommentsByPostId$Query$GetCommentsByPostId> getCommentsByPostId;

  @override
  List<Object> get props => [getCommentsByPostId];
  Map<String, dynamic> toJson() => _$GetCommentsByPostId$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUserInfo$Mutation$CreateUserInfo with EquatableMixin {
  CreateUserInfo$Mutation$CreateUserInfo();

  factory CreateUserInfo$Mutation$CreateUserInfo.fromJson(
          Map<String, dynamic> json) =>
      _$CreateUserInfo$Mutation$CreateUserInfoFromJson(json);

  String userId;

  String id;

  String userImageUrl;

  String username;

  String email;

  @override
  List<Object> get props => [userId, id, userImageUrl, username, email];
  Map<String, dynamic> toJson() =>
      _$CreateUserInfo$Mutation$CreateUserInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUserInfo$Mutation with EquatableMixin {
  CreateUserInfo$Mutation();

  factory CreateUserInfo$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateUserInfo$MutationFromJson(json);

  CreateUserInfo$Mutation$CreateUserInfo createUserInfo;

  @override
  List<Object> get props => [createUserInfo];
  Map<String, dynamic> toJson() => _$CreateUserInfo$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUserInfoArgs with EquatableMixin {
  CreateUserInfoArgs(
      {this.alias, this.email, this.userId, this.userImageUrl, this.username});

  factory CreateUserInfoArgs.fromJson(Map<String, dynamic> json) =>
      _$CreateUserInfoArgsFromJson(json);

  String alias;

  String email;

  String userId;

  String userImageUrl;

  String username;

  @override
  List<Object> get props => [alias, email, userId, userImageUrl, username];
  Map<String, dynamic> toJson() => _$CreateUserInfoArgsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateConversation$Mutation$CreateConversation with EquatableMixin {
  CreateConversation$Mutation$CreateConversation();

  factory CreateConversation$Mutation$CreateConversation.fromJson(
          Map<String, dynamic> json) =>
      _$CreateConversation$Mutation$CreateConversationFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$CreateConversation$Mutation$CreateConversationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateConversation$Mutation with EquatableMixin {
  CreateConversation$Mutation();

  factory CreateConversation$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateConversation$MutationFromJson(json);

  CreateConversation$Mutation$CreateConversation createConversation;

  @override
  List<Object> get props => [createConversation];
  Map<String, dynamic> toJson() => _$CreateConversation$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateConversationInput with EquatableMixin {
  CreateConversationInput(
      {this.commentId,
      this.locked,
      this.messages,
      this.postId,
      this.recieverId,
      this.senderId,
      this.userInfoId});

  factory CreateConversationInput.fromJson(Map<String, dynamic> json) =>
      _$CreateConversationInputFromJson(json);

  String commentId;

  bool locked;

  List<CreateMessageInput> messages;

  String postId;

  String recieverId;

  String senderId;

  String userInfoId;

  @override
  List<Object> get props =>
      [commentId, locked, messages, postId, recieverId, senderId, userInfoId];
  Map<String, dynamic> toJson() => _$CreateConversationInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetConversations$Query$GetConversationsByUserInfo$Incomings
    with EquatableMixin, ConvoMixin {
  GetConversations$Query$GetConversationsByUserInfo$Incomings();

  factory GetConversations$Query$GetConversationsByUserInfo$Incomings.fromJson(
          Map<String, dynamic> json) =>
      _$GetConversations$Query$GetConversationsByUserInfo$IncomingsFromJson(
          json);

  @override
  List<Object> get props =>
      [comment, id, newMessage, locked, post, messages, reciever, sender];
  Map<String, dynamic> toJson() =>
      _$GetConversations$Query$GetConversationsByUserInfo$IncomingsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetConversations$Query$GetConversationsByUserInfo$Outgoings
    with EquatableMixin, ConvoMixin {
  GetConversations$Query$GetConversationsByUserInfo$Outgoings();

  factory GetConversations$Query$GetConversationsByUserInfo$Outgoings.fromJson(
          Map<String, dynamic> json) =>
      _$GetConversations$Query$GetConversationsByUserInfo$OutgoingsFromJson(
          json);

  @override
  List<Object> get props =>
      [comment, id, newMessage, locked, post, messages, reciever, sender];
  Map<String, dynamic> toJson() =>
      _$GetConversations$Query$GetConversationsByUserInfo$OutgoingsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetConversations$Query$GetConversationsByUserInfo with EquatableMixin {
  GetConversations$Query$GetConversationsByUserInfo();

  factory GetConversations$Query$GetConversationsByUserInfo.fromJson(
          Map<String, dynamic> json) =>
      _$GetConversations$Query$GetConversationsByUserInfoFromJson(json);

  List<GetConversations$Query$GetConversationsByUserInfo$Incomings> incomings;

  List<GetConversations$Query$GetConversationsByUserInfo$Outgoings> outgoings;

  String id;

  @override
  List<Object> get props => [incomings, outgoings, id];
  Map<String, dynamic> toJson() =>
      _$GetConversations$Query$GetConversationsByUserInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetConversations$Query with EquatableMixin {
  GetConversations$Query();

  factory GetConversations$Query.fromJson(Map<String, dynamic> json) =>
      _$GetConversations$QueryFromJson(json);

  GetConversations$Query$GetConversationsByUserInfo getConversationsByUserInfo;

  @override
  List<Object> get props => [getConversationsByUserInfo];
  Map<String, dynamic> toJson() => _$GetConversations$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConvoMixin$Comment with EquatableMixin {
  ConvoMixin$Comment();

  factory ConvoMixin$Comment.fromJson(Map<String, dynamic> json) =>
      _$ConvoMixin$CommentFromJson(json);

  String content;

  DateTime createdAt;

  @override
  List<Object> get props => [content, createdAt];
  Map<String, dynamic> toJson() => _$ConvoMixin$CommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConvoMixin$Post with EquatableMixin {
  ConvoMixin$Post();

  factory ConvoMixin$Post.fromJson(Map<String, dynamic> json) =>
      _$ConvoMixin$PostFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() => _$ConvoMixin$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConvoMixin$Messages with EquatableMixin {
  ConvoMixin$Messages();

  factory ConvoMixin$Messages.fromJson(Map<String, dynamic> json) =>
      _$ConvoMixin$MessagesFromJson(json);

  String content;

  String sender;

  DateTime createdAt;

  @override
  List<Object> get props => [content, sender, createdAt];
  Map<String, dynamic> toJson() => _$ConvoMixin$MessagesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConvoMixin$Reciever with EquatableMixin {
  ConvoMixin$Reciever();

  factory ConvoMixin$Reciever.fromJson(Map<String, dynamic> json) =>
      _$ConvoMixin$RecieverFromJson(json);

  String username;

  String alias;

  String id;

  String userImageUrl;

  @override
  List<Object> get props => [username, alias, id, userImageUrl];
  Map<String, dynamic> toJson() => _$ConvoMixin$RecieverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConvoMixin$Sender with EquatableMixin {
  ConvoMixin$Sender();

  factory ConvoMixin$Sender.fromJson(Map<String, dynamic> json) =>
      _$ConvoMixin$SenderFromJson(json);

  String alias;

  String username;

  String id;

  String userImageUrl;

  @override
  List<Object> get props => [alias, username, id, userImageUrl];
  Map<String, dynamic> toJson() => _$ConvoMixin$SenderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserInfoByEmail$Query$GetUserInfoByEmail$Watching
    with EquatableMixin, PMixin {
  GetUserInfoByEmail$Query$GetUserInfoByEmail$Watching();

  factory GetUserInfoByEmail$Query$GetUserInfoByEmail$Watching.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserInfoByEmail$Query$GetUserInfoByEmail$WatchingFromJson(json);

  @override
  List<Object> get props => [
        id,
        category,
        content,
        createdAt,
        make,
        model,
        subCategory,
        title,
        userId,
        username,
        userImageUrl,
        views,
        year
      ];
  Map<String, dynamic> toJson() =>
      _$GetUserInfoByEmail$Query$GetUserInfoByEmail$WatchingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserInfoByEmail$Query$GetUserInfoByEmail with EquatableMixin {
  GetUserInfoByEmail$Query$GetUserInfoByEmail();

  factory GetUserInfoByEmail$Query$GetUserInfoByEmail.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserInfoByEmail$Query$GetUserInfoByEmailFromJson(json);

  String id;

  String username;

  String userId;

  String email;

  String alias;

  String userImageUrl;

  List<GetUserInfoByEmail$Query$GetUserInfoByEmail$Watching> watching;

  @override
  List<Object> get props =>
      [id, username, userId, email, alias, userImageUrl, watching];
  Map<String, dynamic> toJson() =>
      _$GetUserInfoByEmail$Query$GetUserInfoByEmailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserInfoByEmail$Query with EquatableMixin {
  GetUserInfoByEmail$Query();

  factory GetUserInfoByEmail$Query.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoByEmail$QueryFromJson(json);

  GetUserInfoByEmail$Query$GetUserInfoByEmail getUserInfoByEmail;

  @override
  List<Object> get props => [getUserInfoByEmail];
  Map<String, dynamic> toJson() => _$GetUserInfoByEmail$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreatePost$Mutation$CreatePost with EquatableMixin {
  CreatePost$Mutation$CreatePost();

  factory CreatePost$Mutation$CreatePost.fromJson(Map<String, dynamic> json) =>
      _$CreatePost$Mutation$CreatePostFromJson(json);

  String id;

  String category;

  String subCategory;

  String content;

  String make;

  String model;

  int year;

  int views;

  String title;

  @override
  List<Object> get props =>
      [id, category, subCategory, content, make, model, year, views, title];
  Map<String, dynamic> toJson() => _$CreatePost$Mutation$CreatePostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreatePost$Mutation with EquatableMixin {
  CreatePost$Mutation();

  factory CreatePost$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreatePost$MutationFromJson(json);

  CreatePost$Mutation$CreatePost createPost;

  @override
  List<Object> get props => [createPost];
  Map<String, dynamic> toJson() => _$CreatePost$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreatePostArgs with EquatableMixin {
  CreatePostArgs(
      {this.category,
      this.content,
      this.make,
      this.model,
      this.subCategory,
      this.title,
      @required this.userInfoId,
      this.views,
      this.year});

  factory CreatePostArgs.fromJson(Map<String, dynamic> json) =>
      _$CreatePostArgsFromJson(json);

  String category;

  String content;

  String make;

  String model;

  String subCategory;

  String title;

  String userInfoId;

  double views;

  double year;

  @override
  List<Object> get props => [
        category,
        content,
        make,
        model,
        subCategory,
        title,
        userInfoId,
        views,
        year
      ];
  Map<String, dynamic> toJson() => _$CreatePostArgsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetWatching$Query$GetWatching with EquatableMixin, PMixin {
  GetWatching$Query$GetWatching();

  factory GetWatching$Query$GetWatching.fromJson(Map<String, dynamic> json) =>
      _$GetWatching$Query$GetWatchingFromJson(json);

  @override
  List<Object> get props => [
        id,
        category,
        content,
        createdAt,
        make,
        model,
        subCategory,
        title,
        userId,
        username,
        userImageUrl,
        views,
        year
      ];
  Map<String, dynamic> toJson() => _$GetWatching$Query$GetWatchingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetWatching$Query with EquatableMixin {
  GetWatching$Query();

  factory GetWatching$Query.fromJson(Map<String, dynamic> json) =>
      _$GetWatching$QueryFromJson(json);

  List<GetWatching$Query$GetWatching> getWatching;

  @override
  List<Object> get props => [getWatching];
  Map<String, dynamic> toJson() => _$GetWatching$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddMessageToConversationArguments extends JsonSerializable
    with EquatableMixin {
  AddMessageToConversationArguments({@required this.messages});

  factory AddMessageToConversationArguments.fromJson(
          Map<String, dynamic> json) =>
      _$AddMessageToConversationArgumentsFromJson(json);

  final AddMessageToConversationInput messages;

  @override
  List<Object> get props => [messages];
  Map<String, dynamic> toJson() =>
      _$AddMessageToConversationArgumentsToJson(this);
}

class AddMessageToConversationMutation extends GraphQLQuery<
    AddMessageToConversation$Mutation, AddMessageToConversationArguments> {
  AddMessageToConversationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'addMessageToConversation'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'messages')),
              type: NamedTypeNode(
                  name: NameNode(value: 'AddMessageToConversationInput'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'addMessageToConversation'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: VariableNode(name: NameNode(value: 'messages')))
              ],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'addMessageToConversation';

  @override
  final AddMessageToConversationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  AddMessageToConversation$Mutation parse(Map<String, dynamic> json) =>
      AddMessageToConversation$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ModifyWatchingArguments extends JsonSerializable with EquatableMixin {
  ModifyWatchingArguments({@required this.input});

  factory ModifyWatchingArguments.fromJson(Map<String, dynamic> json) =>
      _$ModifyWatchingArgumentsFromJson(json);

  final AddPostToWatchArgs input;

  @override
  List<Object> get props => [input];
  Map<String, dynamic> toJson() => _$ModifyWatchingArgumentsToJson(this);
}

class ModifyWatchingMutation
    extends GraphQLQuery<ModifyWatching$Mutation, ModifyWatchingArguments> {
  ModifyWatchingMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'modifyWatching'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'AddPostToWatchArgs'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'modifyWatching'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: VariableNode(name: NameNode(value: 'input')))
              ],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'modifyWatching';

  @override
  final ModifyWatchingArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  ModifyWatching$Mutation parse(Map<String, dynamic> json) =>
      ModifyWatching$Mutation.fromJson(json);
}

class GetPostsQuery extends GraphQLQuery<GetPosts$Query, JsonSerializable> {
  GetPostsQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'getPosts'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'getPosts'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'category'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'subCategory'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'content'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'make'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'model'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'year'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'views'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'title'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'createdAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'userInfo'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'userId'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'userImageUrl'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'username'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'getPosts';

  @override
  List<Object> get props => [document, operationName];
  @override
  GetPosts$Query parse(Map<String, dynamic> json) =>
      GetPosts$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateCommentArguments extends JsonSerializable with EquatableMixin {
  CreateCommentArguments({@required this.input});

  factory CreateCommentArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentArgumentsFromJson(json);

  final CreateCommentInput input;

  @override
  List<Object> get props => [input];
  Map<String, dynamic> toJson() => _$CreateCommentArgumentsToJson(this);
}

class CreateCommentMutation
    extends GraphQLQuery<CreateComment$Mutation, CreateCommentArguments> {
  CreateCommentMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'createComment'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'CreateCommentInput'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'createComment'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'createCommentInput'),
                    value: VariableNode(name: NameNode(value: 'input')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'createComment';

  @override
  final CreateCommentArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateComment$Mutation parse(Map<String, dynamic> json) =>
      CreateComment$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetCommentsByPostIdArguments extends JsonSerializable
    with EquatableMixin {
  GetCommentsByPostIdArguments({@required this.id});

  factory GetCommentsByPostIdArguments.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsByPostIdArgumentsFromJson(json);

  final String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() => _$GetCommentsByPostIdArgumentsToJson(this);
}

class GetCommentsByPostIdQuery extends GraphQLQuery<GetCommentsByPostId$Query,
    GetCommentsByPostIdArguments> {
  GetCommentsByPostIdQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'getCommentsByPostId'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'getCommentsByPostId'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'postId'),
                    value: VariableNode(name: NameNode(value: 'id')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'content'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'isOffer'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'postId'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'userId'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'userImageUrl'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'username'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'createdAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'getCommentsByPostId';

  @override
  final GetCommentsByPostIdArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetCommentsByPostId$Query parse(Map<String, dynamic> json) =>
      GetCommentsByPostId$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateUserInfoArguments extends JsonSerializable with EquatableMixin {
  CreateUserInfoArguments({@required this.input});

  factory CreateUserInfoArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateUserInfoArgumentsFromJson(json);

  final CreateUserInfoArgs input;

  @override
  List<Object> get props => [input];
  Map<String, dynamic> toJson() => _$CreateUserInfoArgumentsToJson(this);
}

class CreateUserInfoMutation
    extends GraphQLQuery<CreateUserInfo$Mutation, CreateUserInfoArguments> {
  CreateUserInfoMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'createUserInfo'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'CreateUserInfoArgs'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'createUserInfo'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: VariableNode(name: NameNode(value: 'input')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'userId'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'userImageUrl'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'username'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'createUserInfo';

  @override
  final CreateUserInfoArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateUserInfo$Mutation parse(Map<String, dynamic> json) =>
      CreateUserInfo$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateConversationArguments extends JsonSerializable with EquatableMixin {
  CreateConversationArguments({@required this.convo});

  factory CreateConversationArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateConversationArgumentsFromJson(json);

  final CreateConversationInput convo;

  @override
  List<Object> get props => [convo];
  Map<String, dynamic> toJson() => _$CreateConversationArgumentsToJson(this);
}

class CreateConversationMutation extends GraphQLQuery<
    CreateConversation$Mutation, CreateConversationArguments> {
  CreateConversationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'createConversation'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'convo')),
              type: NamedTypeNode(
                  name: NameNode(value: 'CreateConversationInput'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'createConversation'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'createConversationInput'),
                    value: VariableNode(name: NameNode(value: 'convo')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'createConversation';

  @override
  final CreateConversationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateConversation$Mutation parse(Map<String, dynamic> json) =>
      CreateConversation$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetConversationsArguments extends JsonSerializable with EquatableMixin {
  GetConversationsArguments({@required this.userId});

  factory GetConversationsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetConversationsArgumentsFromJson(json);

  final String userId;

  @override
  List<Object> get props => [userId];
  Map<String, dynamic> toJson() => _$GetConversationsArgumentsToJson(this);
}

class GetConversationsQuery
    extends GraphQLQuery<GetConversations$Query, GetConversationsArguments> {
  GetConversationsQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'getConversations'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'getConversationsByUserInfo'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'userId')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'incomings'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                          name: NameNode(value: 'convo'), directives: [])
                    ])),
                FieldNode(
                    name: NameNode(value: 'outgoings'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                          name: NameNode(value: 'convo'), directives: [])
                    ])),
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'convo'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'Conversation'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'comment'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'content'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'createdAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ])),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'newMessage'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'locked'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'post'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ])),
          FieldNode(
              name: NameNode(value: 'messages'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'content'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'sender'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'createdAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ])),
          FieldNode(
              name: NameNode(value: 'reciever'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'username'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'alias'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'userImageUrl'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ])),
          FieldNode(
              name: NameNode(value: 'sender'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'alias'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'username'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'userImageUrl'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'getConversations';

  @override
  final GetConversationsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetConversations$Query parse(Map<String, dynamic> json) =>
      GetConversations$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserInfoByEmailArguments extends JsonSerializable with EquatableMixin {
  GetUserInfoByEmailArguments({@required this.email});

  factory GetUserInfoByEmailArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoByEmailArgumentsFromJson(json);

  final String email;

  @override
  List<Object> get props => [email];
  Map<String, dynamic> toJson() => _$GetUserInfoByEmailArgumentsToJson(this);
}

class GetUserInfoByEmailQuery extends GraphQLQuery<GetUserInfoByEmail$Query,
    GetUserInfoByEmailArguments> {
  GetUserInfoByEmailQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'getUserInfoByEmail'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'email')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'getUserInfoByEmail'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: VariableNode(name: NameNode(value: 'email')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'username'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'userId'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'alias'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'userImageUrl'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'watching'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                          name: NameNode(value: 'p'), directives: [])
                    ]))
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'p'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(name: NameNode(value: 'Post'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'category'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'content'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'createdAt'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'make'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'model'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'subCategory'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'title'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'userId'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'username'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'userImageUrl'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'views'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'year'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'getUserInfoByEmail';

  @override
  final GetUserInfoByEmailArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetUserInfoByEmail$Query parse(Map<String, dynamic> json) =>
      GetUserInfoByEmail$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreatePostArguments extends JsonSerializable with EquatableMixin {
  CreatePostArguments({@required this.postInput});

  factory CreatePostArguments.fromJson(Map<String, dynamic> json) =>
      _$CreatePostArgumentsFromJson(json);

  final CreatePostArgs postInput;

  @override
  List<Object> get props => [postInput];
  Map<String, dynamic> toJson() => _$CreatePostArgumentsToJson(this);
}

class CreatePostMutation
    extends GraphQLQuery<CreatePost$Mutation, CreatePostArguments> {
  CreatePostMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'createPost'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'postInput')),
              type: NamedTypeNode(
                  name: NameNode(value: 'CreatePostArgs'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'createPost'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: VariableNode(name: NameNode(value: 'postInput')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'category'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'subCategory'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'content'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'make'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'model'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'year'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'views'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'title'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'createPost';

  @override
  final CreatePostArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreatePost$Mutation parse(Map<String, dynamic> json) =>
      CreatePost$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetWatchingArguments extends JsonSerializable with EquatableMixin {
  GetWatchingArguments({@required this.id});

  factory GetWatchingArguments.fromJson(Map<String, dynamic> json) =>
      _$GetWatchingArgumentsFromJson(json);

  final String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() => _$GetWatchingArgumentsToJson(this);
}

class GetWatchingQuery
    extends GraphQLQuery<GetWatching$Query, GetWatchingArguments> {
  GetWatchingQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'getWatching'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'getWatching'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'id')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(name: NameNode(value: 'p'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'p'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(name: NameNode(value: 'Post'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'category'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'content'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'createdAt'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'make'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'model'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'subCategory'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'title'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'userId'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'username'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'userImageUrl'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'views'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'year'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'getWatching';

  @override
  final GetWatchingArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetWatching$Query parse(Map<String, dynamic> json) =>
      GetWatching$Query.fromJson(json);
}
