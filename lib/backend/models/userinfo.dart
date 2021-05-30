import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/post.model.dart';

class UserInfoModel {
  String username;
  String userImageUrl;
  String userId;
  String email;
  String alias;
  String id;

  List<PostModel> posts;
  List<PostModel> watching;
  List<ConversationModel> incomings;
  List<ConversationModel> outgoings;

  UserInfoModel({
    this.username = '',
    this.userImageUrl = '',
    this.userId = '',
    this.email = '',
    this.alias = '',
    this.id = '',
    this.posts = const [],
    this.watching = const [],
    this.incomings = const [],
    this.outgoings = const [],
  });
  Map<String, PostModel> watchingMap = Map();

  factory UserInfoModel.empty() => UserInfoModel();

  UserInfoModel copyWith({
    String username,
    String userImageUrl,
    String userId,
    String email,
    String alias,
    String id,
    List<PostModel> posts,
    List<PostModel> watching,
  }) {
    return UserInfoModel(
      username: username ?? this.username,
      userImageUrl: userImageUrl ?? this.userImageUrl,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      alias: alias ?? this.alias,
      id: id ?? this.id,
      posts: posts ?? this.posts,
      watching: watching ?? this.watching,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'userImageUrl': userImageUrl,
      'userId': userId,
      'email': email,
      'alias': alias,
      'id': id,
      'posts': posts?.map((x) => x.toMap())?.toList(),
      'watching': watching?.map((x) => x.toMap())?.toList(),
      'incomings': incomings?.map((x) => x.toMap())?.toList(),
      'outgoings': outgoings?.map((x) => x.toMap())?.toList(),
    };
  }

  factory UserInfoModel.fromMapForConvo(Map<String, dynamic> json) {
    var userinfo = UserInfoModel.empty();

    userinfo.incomings =
        json["incomings"].map((e) => ConversationModel.fromMap(e)).toList();
    userinfo.outgoings =
        json["outgoings"].map((e) => ConversationModel.fromMap(e)).toList();

    return userinfo;
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      username: map['username'] ?? '',
      userImageUrl: map['userImageUrl'] ?? '',
      userId: map['userId'] ?? '',
      email: map['email'] ?? '',
      alias: map['alias'] ?? '',
      id: map['id'] ?? '',
      posts: List<PostModel>.from(
          map['posts']?.map((x) => PostModel.fromMap(x) ?? PostModel()) ??
              const []),
      watching: List<PostModel>.from(map['watching']?.map(
              (x) => PostModel.fromMapWithoutUserinfo(x) ?? PostModel()) ??
          const []),
      incomings: List<ConversationModel>.from(map['incomings']?.map(
              (x) => ConversationModel.fromMap(x) ?? ConversationModel()) ??
          const []),
      outgoings: List<ConversationModel>.from(map['outgoings']?.map(
              (x) => ConversationModel.fromMap(x) ?? ConversationModel()) ??
          const []),
    );
  }

  factory UserInfoModel.forPost(Map<String, dynamic> map) {
    var u = UserInfoModel.empty();
    u.username = map["username"];
    u.userImageUrl = map["userImageUrl"];
    u.userId = map["userId"];
    u.id = map["id"];

    return u;
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) =>
      UserInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserInfoModel(username: $username, userImageUrl: $userImageUrl, userId: $userId, email: $email, alias: $alias, id: $id, posts: $posts, watching: $watching, incomings: $incomings, outgoings: $outgoings)';
  }

  UserInfoModel operator <<(dynamic other) {
    var uim = UserInfoModel.fromMap(other);
    uim.populateMap();
    return uim;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfoModel &&
        other.username == username &&
        other.userImageUrl == userImageUrl &&
        other.userId == userId &&
        other.email == email &&
        other.alias == alias &&
        other.id == id &&
        listEquals(other.posts, posts) &&
        listEquals(other.watching, watching) &&
        listEquals(other.incomings, incomings) &&
        listEquals(other.outgoings, outgoings);
  }

  @override
  int get hashCode {
    return username.hashCode ^
        userImageUrl.hashCode ^
        userId.hashCode ^
        email.hashCode ^
        alias.hashCode ^
        id.hashCode ^
        posts.hashCode ^
        watching.hashCode;
  }

  addToWatching(PostModel post) {
    watching.add(post);
    watchingMap.putIfAbsent(post.id, () => post);
  }

  void removeFromWatch(PostModel post) {
    watching.remove(post);
    watchingMap.remove(post.id);
  }
}

extension on UserInfoModel {
  populateMap() {
    for (var item in watching) {
      watchingMap.putIfAbsent(item.id, () => item);
    }
  }
}
