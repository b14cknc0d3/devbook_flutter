import 'dart:convert';

import 'package:appwrite/models.dart';
import 'package:devbook/src/model/profile.dart';
import 'package:devbook/src/utils/extensions.dart';

class RoomList {
  late List<Room> data;

  RoomList({
    required this.data,
  });

  RoomList.fromMap(DocumentList docList) {
    final Map<String, dynamic> dm = docList.toMap();
    final List<dynamic> d = dm['documents'].toList();
    if (d.isNotEmpty) {
      data = d.map((e) => Room.fromMap(e['data'])).toList();
    } else {
      data = <Room>[];
    }
  }
}

class Room {
  late Profile fromUserProfile;
  late Profile toUserProfile;
  late String fromUser;
  late String toUser;
  // late String message;
  late DateTime createdAt;
  late DateTime updatedAt;
  String? $id;
  late String roomId;
  late String? lastMessage;

  Room({
    required this.fromUser,
    required this.toUser,
    // required this.message,
    required this.createdAt,
    required this.updatedAt,
    required this.fromUserProfile,
    required this.toUserProfile,
    this.$id,
    this.lastMessage,
    // required this.roomId,
  });

  Room.fromMap(Map<String, dynamic> map) {
    roomId = map['room_id'];
    fromUser = map['from_user'];
    toUser = map['to_user'];
    // message = map['latest_message'];
    createdAt = DateTime.parse(map['createdAt']);
    updatedAt = DateTime.parse(map['updatedAt']);
    fromUserProfile = Profile.fromMap(jsonDecode(map['from_user_profile']));
    toUserProfile = Profile.fromMap(jsonDecode(map['to_user_profile']));
    lastMessage = map['last_message'];
    $id = map['\$id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'room_id': "${fromUser}_$toUser".generateMd5(),
      'from_user': fromUser,
      'to_user': toUser,
      'to_user_profile': jsonEncode(toUserProfile.toMap()),
      'from_user_profile': jsonEncode(fromUserProfile.toMap()),
      // 'latest_message': message,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Room{roomId: $roomId}';
  }
}
