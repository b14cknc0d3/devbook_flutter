import 'dart:convert';

import 'package:devbook/src/model/profile.dart';

class Post {
  late Profile author;
  late String body;
  List? comments;
  List? likes;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int commentsCount;
  late int likesCount;

  Post({
    required this.author,
    required this.body,
    this.comments,
    this.likes,
    required this.createdAt,
    required this.updatedAt,
  });
  Post.fromMap(Map<String, dynamic> map) {
    author = Profile.fromMap(jsonDecode((map['author'])));
    body = map['body'];
    comments = map['comments'];
    likes = map['like'];
    likesCount = likes?.length ?? 0;
    commentsCount = comments?.length ?? 0;
    createdAt = DateTime.parse(map['createdAt']);
    updatedAt = DateTime.parse(map['updatedAt']);
  }

  Map<String, dynamic> toMap() {
    return {
      'author': jsonEncode(author.toMap()),
      'body': body,
      'comments': comments,
      'likes': likes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

// class Author {
//   late String name;
//   late String id;
//   late String email;

//   Author({
//     required this.name,
//     required this.id,
//     required this.email,
//   });
//   Map<String, dynamic> toMap() {
//     Map<String, dynamic> map = <String, dynamic>{};
//     map['name'] = name;
//     map['\$id'] = id;
//     map['email'] = email;
//     return map;
//   }

//   // ignore: unused_element
//   Author.fromMap(Map<String, dynamic> map) {
//     name = map['name'];
//     id = map['\$id'];
//     email = map['email'];
//   }
// }
