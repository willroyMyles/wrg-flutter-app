import 'dart:convert';

class MessagesModel {
  String sender;
  String content;
  String id;
  DateTime createdAt;

  MessagesModel({
    this.sender = '',
    this.content = '',
    this.id = '',
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'content': content,
      'id': id,
      // 'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory MessagesModel.fromMap(Map<String, dynamic> map) {
    return MessagesModel(
      sender: map['sender'],
      content: map['content'],
      id: map['id'],
      createdAt: DateTime.tryParse(map['createdAt']),
    );
  }

  factory MessagesModel.empty() => MessagesModel();

  String toJson() => json.encode(toMap());

  factory MessagesModel.fromJson(String source) =>
      MessagesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MessagesModel(sender: $sender, content: $content, id: $id, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessagesModel &&
        other.sender == sender &&
        other.content == content &&
        other.id == id &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return sender.hashCode ^
        content.hashCode ^
        id.hashCode ^
        createdAt.hashCode;
  }

  MessagesModel copyWith({
    String sender,
    String content,
    String id,
    DateTime createdAt,
  }) {
    return MessagesModel(
      sender: sender ?? this.sender,
      content: content ?? this.content,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
