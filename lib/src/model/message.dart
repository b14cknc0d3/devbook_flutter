class Message {
  late String fromUser;
  late String toUser;
  late String message;
  late DateTime createdAt;
  late DateTime updatedAt;
  String? $id;
  late String roomId;

  Message({
    required this.fromUser,
    required this.toUser,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    this.$id,
    required this.roomId,
  });

  Message.fromMap(Map<String, dynamic> map) {
    roomId = map['room_id'];
    fromUser = map['from_user'];
    toUser = map['to_user'];
    message = map['message'];
    createdAt = DateTime.parse(map['createdAt']);
    updatedAt = DateTime.parse(map['updatedAt']);
    $id = map['\$id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'room_id': roomId,
      'from_user': fromUser,
      'to_user': toUser,
      'message': message,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Message{fromUser: $fromUser}';
  }
}
