import 'dart:convert';

class MessagesModel {
  String sender;
  String content;
  String id;

  MessagesModel({
    this.sender = '',
    this.content = '',
    this.id = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'content': content,
      'id': id,
    };
  }

  factory MessagesModel.fromMap(Map<String, dynamic> map) {
    return MessagesModel(
      sender: map['sender'] ?? '',
      content: map['content'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessagesModel.fromJson(String source) =>
      MessagesModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'MessagesModel(sender: $sender, content: $content, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessagesModel &&
        other.sender == sender &&
        other.content == content &&
        other.id == id;
  }

  @override
  int get hashCode => super.hashCode;
}
