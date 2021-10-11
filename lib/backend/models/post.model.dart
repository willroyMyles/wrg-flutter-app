import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wrg2/backend/enums/enum.post.dart';

import 'package:wrg2/backend/models/offer.dart';
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
  int watching = 0;
  int commentss = 0;
  DateTime createdAt;
  String userInfoId;
  UserInfoModel userInfo;
  Status status = Status.OPEN;
  List<OfferModel> offers = [];

  PostModel({
    this.title = '',
    this.id = '',
    this.content = '',
    this.category = '',
    this.make = '',
    this.model = '',
    this.year = 0,
    this.views = 0,
    this.watching = 0,
    this.commentss = 0,
    this.createdAt,
    this.userInfoId = '',
    this.userInfo,
    this.offers,
    this.status = Status.OPEN,
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
      'status': status.index,
      // 'userInfo': userInfo.toMap(),
      'offers': offers?.map((x) => x.toMap())?.toList(),
    };
  }

  bool contains(Map<String, dynamic> map, String key) => map.containsKey(key);

  factory PostModel.fromMap(Map<String, dynamic> map) {
    var st = Status.values.firstWhere((element) {
      var name = element.name.toUpperCase();
      return name == map["status"];
    });
    if (st == null) st = Status.OPEN;
    return PostModel(
      title: map['title'],
      id: map['id'],
      content: map['content'],
      category: map['category'],
      make: map['make'],
      model: map['model'],
      year: map['year'],
      views: map['views'],
      commentss: map['commentss'],
      watching: map['watching'],
      status: st,
      createdAt: DateTime.tryParse(map['createdAt']),
      userInfoId: map['userInfoId'],
      userInfo: UserInfoModel.fromMap(map['userInfo']),
      offers: map["offers"] != null
          ? List<OfferModel>.from(
              map['offers']?.map((x) => OfferModel.fromMap(x)))
          : [],
    );
  }

  factory PostModel.fromMapWithoutUserinfo(Map<String, dynamic> map) {
    if (map == null) return PostModel();
    var cat = DateTime.parse(map["createdAt"]);
    var st = Status.values.firstWhere((element) {
      var name = element.name.toUpperCase();
      return name == map["status"];
    });
    if (st == null) st = Status.OPEN;
    var p = PostModel(
      title: map['title'],
      id: map['id'],
      content: map['content'],
      category: map['category'],
      make: map['make'],
      model: map['model'],
      year: map['year'],
      views: map['views'],
      commentss: map['commentss'],
      watching: map['watching'],
      status: st,
      createdAt: cat,
    );

    return p;
  }
  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(title: $title, id: $id, content: $content, category: $category, make: $make, model: $model, year: $year, views: $views, watching: $watching, commentss: $commentss, createdAt: $createdAt, staus: $status, userInfoId: $userInfoId, userInfo: $userInfo, offers: $offers)';
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
        other.watching == watching &&
        other.commentss == commentss &&
        other.createdAt == createdAt &&
        other.userInfoId == userInfoId &&
        other.userInfo == userInfo &&
        listEquals(other.offers, offers);
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
        watching.hashCode ^
        commentss.hashCode ^
        createdAt.hashCode ^
        userInfoId.hashCode ^
        userInfo.hashCode ^
        offers.hashCode;
  }

  bool isWatching() {
    var service = Get.find<InformationService>();
    return service.watching.containsKey(id);
  }

  amIOwner() {
    var service = Get.find<ApiExecutor>();
    return this.userInfo.id == service.userInfo.value.userId;
  }
}
