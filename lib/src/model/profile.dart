import 'dart:convert';

import 'package:appwrite/models.dart';

class ProfileDocumentList {
  late List<Profile> data;
  ProfileDocumentList({required this.data});

  ProfileDocumentList.fromMap(DocumentList docList) {
    final Map<String, dynamic> dm = docList.toMap();
    final List<dynamic> d = dm['documents'].toList();
    if (d.isNotEmpty) {
      data = d.map((e) => Profile.fromMap(e['data'])).toList();
    } else {
      data = <Profile>[];
    }
  }
}

class Profile {
  String? $id;
  String? id;
  String? userName;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  String? bio;
  String? hobby;
  String? skill;
  late DateTime createdAt;
  late DateTime updatedAt;
  String? profileImage;
  String? coverImage;
  String? userId;
  _User? user;
  String? userRole;

  Profile({
    this.$id,
    this.id,
    this.userName,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.bio,
    this.hobby,
    this.skill,
    required this.createdAt,
    required this.updatedAt,
    required this.profileImage,
    this.coverImage,
    this.userId,
    this.userRole,
  });

  Profile.fromMap(Map<String, dynamic> map) {
    $id = map['\$id'];
    id = map['id'];
    profileImage = map['profile_pic_url'];
    email = map['email'];
    phone = map['phone'];
    address = map['address'];
    city = map['city'];
    state = map['state'];
    country = map['country'];
    zipCode = map['zipCode'];
    bio = map['bio'];
    hobby = map['hobby'];
    skill = map['skill'];
    createdAt = DateTime.parse(map['createdAt']);
    updatedAt = DateTime.parse(map['updatedAt']);
    user = map['user_map'] == null ? null : _User.fromMap(map['user_map']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'zipCode': zipCode,
      'bio': bio,
      'hobby': hobby,
      'skill': skill,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'user_map': user?.toMapString(),
      'profile_pic_url': profileImage,
    };
  }
}

class _User {
  late String name;
  late String id;
  late String email;

  _User({
    required this.name,
    required this.id,
    required this.email,
  });
  String toMapString() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['\$id'] = id;
    map['email'] = email;
    return jsonEncode(map);
  }

  // ignore: unused_element
  _User.fromMap(String data) {
    Map<String, dynamic> map = jsonDecode(data);
    name = map['name'];
    id = map['\$id'];
    email = map['email'];
  }
}
