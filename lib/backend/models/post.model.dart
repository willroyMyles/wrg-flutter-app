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
  int year = 0;
  int views = 0;
  DateTime createdAt;
  String userInfoId;
  UserInfoModel userInfo;

  PostModel({
    this.title = '',
    this.id = '',
    this.content = '',
    this.category = '',
    this.make = '',
    this.model = '',
    this.year = 0,
    this.views = 0,
    this.createdAt,
    this.userInfoId = '',
    this.userInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      // 'id': id,
      'content': content,
      'category': category,
      'make': make,
      'model': model,
      'year': year,
      'views': views,
      'userInfoId': userInfoId,
      // 'createdAt': createdAt.millisecondsSinceEpoch,
      // 'userInfo': userInfo.toMap(),
    };
  }

  bool contains(Map<String, dynamic> map, String key) => map.containsKey(key);

  factory PostModel.fromMap(Map<dynamic, dynamic> map) {
    print(map);
    return PostModel(
      title: map['title'],
      id: map['id'],
      content: map['content'],
      category: map['category'],
      make: map['make'],
      model: map['model'],
      year: map['year'],
      views: map['views'],
      createdAt: DateTime.tryParse(map['createdAt']),
      userInfoId: map['userInfoId'],
      userInfo: UserInfoModel.fromMap(map['UserInfo']),
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
    return 'PostModel(title: $title, id: $id, content: $content, category: $category, make: $make, model: $model, year: $year, views: $views, createdAt: $createdAt, userInfoId: $userInfoId, userInfo: $userInfo)';
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
        other.year == year &&
        other.views == views &&
        other.createdAt == createdAt &&
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
        year.hashCode ^
        views.hashCode ^
        createdAt.hashCode ^
        userInfoId.hashCode ^
        userInfo.hashCode;
  }

  bool isWatching() {
    var service = Get.find<InformationService>();
    return service.watching.containsKey(id);
  }

  amIOwner() {
    var service = Get.find<ApiExecutor>();
    return this.userInfo.id == service.userInfo.value.userId;
  }

  PostModel copyWith({
    String title,
    String id,
    String content,
    String category,
    String make,
    String model,
    int year,
    int views,
    DateTime createdAt,
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
      year: year ?? this.year,
      views: views ?? this.views,
      createdAt: createdAt ?? this.createdAt,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo: userInfo ?? this.userInfo,
    );
  }
}
