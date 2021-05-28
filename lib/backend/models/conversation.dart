import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/models/comment.model.dart';
import 'package:wrg2/backend/models/messages.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/backend/services/service.api.dart';

class ConversationModel {
  UserInfoModel reciever;
  UserInfoModel sender;
  List<MessagesModel> messages = [];
  bool locked = false;
  CommentModel comment;
  PostModel post;
  String newMessage;
  String id;

  bool hasNewMessageForMe() {
    final APIService ser = Get.find();
    return newMessage == ser.userInfo.value.id;
  }

  bool amISender(MessagesModel model) {
    final APIService ser = Get.find();
    var isSender = model.sender == ser.userInfo.value.id;
    return isSender;
  }

  getOthersId() {
    final APIService ser = Get.find();
    return sender.id == ser.userInfo.value.id ? reciever.id : sender.id;
  }

  getOthersName() {
    final APIService ser = Get.find();
    return sender.id == ser.userInfo.value.id
        ? reciever.username
        : sender.username;
  }

  ConversationModel({
    this.reciever,
    this.sender,
    this.messages = const [],
    this.locked = false,
    this.comment,
    this.post,
    this.newMessage = '',
    this.id = '',
  });

  factory ConversationModel.empty() => ConversationModel();

  Map<String, dynamic> toMap() {
    return {
      'reciever': reciever.toMap(),
      'sender': sender.toMap(),
      'messages': messages.map((x) => x.toMap())?.toList(),
      'locked': locked,
      'comment': comment.toMap(),
      'post': post?.toMap(),
      'newMessage': newMessage,
      'id': id,
    };
  }

  factory ConversationModel.fromMap(Map<String, dynamic> map) {
    return ConversationModel(
      reciever: UserInfoModel.fromMap(map['reciever']) ?? UserInfoModel(),
      sender: UserInfoModel.fromMap(map['sender']) ?? UserInfoModel(),
      messages: List<MessagesModel>.from(map['messages']
              ?.map((x) => MessagesModel.fromMap(x) ?? MessagesModel()) ??
          const []),
      locked: map['locked'] ?? false,
      comment: CommentModel.fromMap(map['comment']) ?? CommentModel(),
      post: PostModel.fromMap(map['post']) ?? PostModel(),
      newMessage: map['newMessage'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConversationModel.fromJson(String source) =>
      ConversationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConversationModel(reciever: $reciever, sender: $sender, messages: $messages, locked: $locked, comment: $comment, post: $post, newMessage: $newMessage, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConversationModel &&
        other.reciever == reciever &&
        other.sender == sender &&
        listEquals(other.messages, messages) &&
        other.locked == locked &&
        other.comment == comment &&
        other.post == post &&
        other.newMessage == newMessage &&
        other.id == id;
  }

  @override
  int get hashCode => super.hashCode;
}
