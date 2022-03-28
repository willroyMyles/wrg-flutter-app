import 'dart:convert';

class ModifyWatching {
  String post;
  String id;
  bool add;
  ModifyWatching({
    this.post,
    this.id,
    this.add,
  });

  ModifyWatching copyWith({
    String post,
    String id,
    bool add,
  }) {
    return ModifyWatching(
      post: post ?? this.post,
      id: id ?? this.id,
      add: add ?? this.add,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'post': post,
      'id': id,
      'add': add,
    };
  }

  factory ModifyWatching.fromMap(Map<String, dynamic> map) {
    return ModifyWatching(
      post: map['post'],
      id: map['id'],
      add: map['add'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModifyWatching.fromJson(String source) =>
      ModifyWatching.fromMap(json.decode(source));

  @override
  String toString() => 'ModifyWatching(post: $post, id: $id, add: $add)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModifyWatching &&
        other.post == post &&
        other.id == id &&
        other.add == add;
  }

  @override
  int get hashCode => post.hashCode ^ id.hashCode ^ add.hashCode;
}
