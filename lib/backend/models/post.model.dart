import 'dart:convert';

import 'package:get/get.dart';

import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/backend/services/service.executor.dart';
import 'package:wrg2/backend/services/service.information.dart';

class PostModel {
  String title = "";
  String id = "";
  String content = "";
  String category = "";
  String make = "";
  String model = "";
  String username = "";
  String userId = "";
  String userImage = "";
  int year = 0;
  int views = 0;
  DateTime createdAt;
  String userInfoId;
  UserInfoModel userInfo;

  PostModel({
    this.createdAt,
    this.title = '',
    this.id = '',
    this.content = '',
    this.category = '',
    this.make = '',
    this.model = '',
    this.username = '',
    this.userId = '',
    this.userImage = '',
    this.year = 0,
    this.views = 0,
    this.userInfoId = '',
    this.userInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'content': content,
      'category': category,
      'make': make,
      'model': model,
      'username': username,
      'userId': userId,
      'userImage': userImage,
      'year': year,
      'views': views,
      'userInfoId': userInfoId,
      'userInfo': userInfo.toMap(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      title: map['title'],
      id: map['id'],
      content: map['content'],
      category: map['category'],
      make: map['make'],
      model: map['model'],
      username: map['username'],
      userId: map['userId'],
      userImage: map['userImage'],
      year: map['year'],
      views: map['views'],
      userInfoId: map['userInfoId'],
      createdAt: DateTime.parse(map['createdAt']),
      userInfo: UserInfoModel.fromMap(map['userInfo']),
    );
  }

  factory PostModel.fromMapWithoutUserinfo(Map<String, dynamic> map) {
    if (map == null) return PostModel();
    var cat = DateTime.parse(map["createdAt"]);
    var p = PostModel(
      title: map['title'],
      id: map['id'],
      content: map['content'],
      category: map['category'],
      make: map['make'],
      model: map['model'],
      year: map['year'],
      views: map['views'],
      createdAt: cat,
    );

    return p;
  }
  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(title: $title, id: $id, content: $content, category: $category, make: $make, model: $model, username: $username, userId: $userId, userImage: $userImage, year: $year, views: $views, userInfoId: $userInfoId, userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.title == title &&
        other.id == id &&
        other.content == content &&
        other.category == category &&
        other.make == make &&
        other.model == model &&
        other.username == username &&
        other.userId == userId &&
        other.userImage == userImage &&
        other.year == year &&
        other.views == views &&
        other.userInfoId == userInfoId &&
        other.userInfo == userInfo;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        id.hashCode ^
        content.hashCode ^
        category.hashCode ^
        make.hashCode ^
        model.hashCode ^
        username.hashCode ^
        userId.hashCode ^
        userImage.hashCode ^
        year.hashCode ^
        views.hashCode ^
        userInfoId.hashCode ^
        userInfo.hashCode;
  }

  bool isWatching() {
    var service = Get.find<InformationService>();
    return service.watching.containsKey(id);
  }

  amIOwner() {
    var service = Get.find<ApiExecutor>();
    return this.userId == service.userInfo.value.userId;
  }

  PostModel copyWith({
    String title,
    String id,
    String content,
    String category,
    String make,
    String model,
    String username,
    String userId,
    String userImage,
    int year,
    int views,
    String userInfoId,
    UserInfoModel userInfo,
  }) {
    return PostModel(
      title: title ?? this.title,
      id: id ?? this.id,
      content: content ?? this.content,
      category: category ?? this.category,
      make: make ?? this.make,
      model: model ?? this.model,
      username: username ?? this.username,
      userId: userId ?? this.userId,
      userImage: userImage ?? this.userImage,
      year: year ?? this.year,
      views: views ?? this.views,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo: userInfo ?? this.userInfo,
    );
  }
}
