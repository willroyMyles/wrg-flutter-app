import 'dart:convert';

import 'package:get/get.dart';

import 'package:wrg2/backend/models/userinfo.dart';
import 'package:wrg2/backend/services/service.executor.dart';

class PostModel {
  String title = "";
  String id = "";
  String content = "";
  String category = "";
  String subCategory = "";
  String make = "";
  String model = "";
  String username = "";
  String userId = "";
  String userImage = "";
  int year = 0;
  int views = 0;
  DateTime createdAt = DateTime.now();
  String userInfoId;
  UserInfoModel userInfo;

  PostModel({
    DateTime createdAt,
    this.title = '',
    this.id = '',
    this.content = '',
    this.category = '',
    this.subCategory = '',
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
      'subCategory': subCategory,
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
    if (map == null) return PostModel();
    return PostModel(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
      content: map['content'] ?? '',
      category: map['category'] ?? '',
      subCategory: map['subCategory'] ?? '',
      make: map['make'] ?? '',
      model: map['model'] ?? '',
      username: map['username'] ?? '',
      userId: map['userId'] ?? '',
      userImage: map['userImage'] ?? '',
      year: map['year'] ?? 0,
      views: map['views'] ?? 0,
      userInfoId: map['userInfoId'] ?? '',
      userInfo: UserInfoModel.forPost(map['userInfo']),
    );
  }

  factory PostModel.fromMapWithoutUserinfo(Map<String, dynamic> map) {
    if (map == null) return PostModel();

    return PostModel(
      title: map['title'],
      id: map['id'],
      content: map['content'],
      category: map['category'],
      subCategory: map['subCategory'],
      make: map['make'],
      model: map['model'],
      year: map['year'],
      views: map['views'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(title: $title, id: $id, content: $content, category: $category, subCategory: $subCategory, make: $make, model: $model, username: $username, userId: $userId, userImage: $userImage, year: $year, views: $views, userInfoId: $userInfoId, userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.title == title &&
        other.id == id &&
        other.content == content &&
        other.category == category &&
        other.subCategory == subCategory &&
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
        subCategory.hashCode ^
        make.hashCode ^
        model.hashCode ^
        username.hashCode ^
        userId.hashCode ^
        userImage.hashCode ^
        year.hashCode ^
        views.hashCode ^
        createdAt.hashCode;
  }

  bool isWatching() {
    var service = Get.find<ApiExecutor>();
    var ui = service.userInfo.value;
    if (ui == null) return false;
    return ui.watchingMap.containsKey(id);
  }

  amIOwner() {
    var service = Get.find<ApiExecutor>();
    return this.userId == service.userInfo.value.userId;
  }
}
