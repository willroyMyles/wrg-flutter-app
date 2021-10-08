import 'dart:convert';

import 'package:wrg2/backend/models/conversation.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/fontend/components/item.conversation.dart';

class OfferModel {
  String id;
  bool accepted = false;
  bool completed = false;
  String message;
  PostModel post;
  String postId;
  ConversationModel conversation;
  UserInfoModel sender;
  UserInfoModel reciever;
  String senderId;

  OfferModel({
    this.id,
    this.accepted,
    this.completed,
    this.message,
    this.post,
    this.postId,
    this.conversation,
    this.sender,
    this.reciever,
    this.senderId,
  });

  OfferModel copyWith({
    String id,
    bool accepted,
    bool completed,
    String message,
    PostModel post,
    String postId,
    ConversationModel conversation,
    UserInfoModel sender,
    UserInfoModel reciever,
    String senderId,
  }) {
    return OfferModel(
      id: id ?? this.id,
      accepted: accepted ?? this.accepted,
      completed: completed ?? this.completed,
      message: message ?? this.message,
      post: post ?? this.post,
      postId: postId ?? this.postId,
      conversation: conversation ?? this.conversation,
      sender: sender ?? this.sender,
      reciever: reciever ?? this.reciever,
      senderId: senderId ?? this.senderId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'accepted': accepted,
      'completed': completed,
      'message': message,
      'postId': postId,
      'senderId': senderId,
    };
  }

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      id: map['id'],
      accepted: map['accepted'],
      completed: map['completed'],
      message: map['message'],
      post: map.containsKey("post") ? PostModel.fromMap(map['post']) : null,
      postId: map['postId'],
      conversation: map.containsKey("conversation")
          ? ConversationModel.fromMap(map['conversation'])
          : null,
      sender: map.containsKey("sender")
          ? UserInfoModel.fromMap(map['sender'])
          : null,
      // reciever: UserInfoModel.fromMap(map['reciever']),
      senderId: map['senderId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferModel.fromJson(String source) =>
      OfferModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OfferModel(id: $id, accepted: $accepted, completed: $completed, message: $message, post: $post, postId: $postId, conversation: $conversation, sender: $sender, reciever: $reciever, senderId: $senderId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OfferModel &&
        other.id == id &&
        other.accepted == accepted &&
        other.completed == completed &&
        other.message == message &&
        other.post == post &&
        other.postId == postId &&
        other.conversation == conversation &&
        other.sender == sender &&
        other.reciever == reciever &&
        other.senderId == senderId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        accepted.hashCode ^
        completed.hashCode ^
        message.hashCode ^
        post.hashCode ^
        postId.hashCode ^
        conversation.hashCode ^
        sender.hashCode ^
        reciever.hashCode ^
        senderId.hashCode;
  }

  factory OfferModel.empty() => OfferModel();
}
