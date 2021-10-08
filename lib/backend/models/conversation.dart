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
  String recieverId;
  String senderId;
  String commentId;
  String postId;

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

  UserInfoModel getOthersUserInfo() {
    final APIService ser = Get.find();
    return sender.id == ser.userInfo.value.id ? reciever : sender;
  }

  ConversationModel({
    this.reciever,
    this.sender,
    this.messages,
    this.locked = false,
    this.comment,
    this.post,
    this.newMessage = '',
    this.id = '',
    this.recieverId,
    this.senderId,
  });

  factory ConversationModel.empty() => ConversationModel(messages: []);

  Map<String, dynamic> toMap() {
    return {
      // 'reciever': reciever.toMap(),
      // 'sender': sender.toMap(),
      'messages': messages?.map((x) => x.toMap())?.toList(),
      'locked': locked,
      // 'comment': comment.toMap(),
      // 'post': post.toMap(),
      // 'newMessage': newMessage,
      // 'id': id,
      'recieverId': recieverId,
      'senderId': senderId,
      'commentId': commentId,
      'postId': postId
    };
  }

  factory ConversationModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return ConversationModel(
      reciever: UserInfoModel.fromMap(map['reciever']),
      sender: UserInfoModel.fromMap(map['sender']),
      messages: List<MessagesModel>.from(
          map['messages']?.map((x) => MessagesModel.fromMap(x))),
      locked: map['locked'],
      // comment: CommentModel.fromMap(map['comment']),
      // post: PostModel.fromMap(map['post']),
      newMessage: map['newMessage'],
      id: map['id'],
      recieverId: map['recieverId'],
      senderId: map['senderId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConversationModel.fromJson(String source) =>
      ConversationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConversationModel(reciever: $reciever, sender: $sender, messages: $messages, locked: $locked, comment: $comment, post: $post, newMessage: $newMessage, id: $id, recieverId: $recieverId, senderId: $senderId)';
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
        other.id == id &&
        other.recieverId == recieverId &&
        other.senderId == senderId;
  }

  @override
  int get hashCode {
    return reciever.hashCode ^
        sender.hashCode ^
        messages.hashCode ^
        locked.hashCode ^
        comment.hashCode ^
        post.hashCode ^
        newMessage.hashCode ^
        id.hashCode ^
        recieverId.hashCode ^
        senderId.hashCode;
  }
}
