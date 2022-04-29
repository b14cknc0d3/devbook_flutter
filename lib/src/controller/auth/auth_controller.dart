import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/models.dart';
import 'package:devbook/src/model/profile.dart';
import 'package:devbook/src/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  Profile? profile;
  User? user;
  Session? session;

  final GetStorage _storage = GetStorage('auth', 'auth', {
    StorageKeys.profile.name: {},
    StorageKeys.user.name: {},
    StorageKeys.session.name: {}
  });

  @override
  void onInit() {
    super.onInit();
    readUserdata();
  }

  void readUserdata() {
    log("[+] READING USER DATA");
    var profiledata = _storage.read(StorageKeys.profile.name);
    if (profiledata != null) {
      profile = Profile.fromMap(jsonDecode(profiledata));
      user = User.fromMap(jsonDecode(_storage.read(StorageKeys.user.name)));
      session =
          Session.fromMap(jsonDecode(_storage.read(StorageKeys.session.name)));
    }
    log("[+] READING USER DATA DONE\n ${profile?.toMap()}");
  }

  void saveUserdata(Profile profile, User user, Session session) {
    this.profile = profile;
    this.user = user;
    this.session = session;
    _storage.write(StorageKeys.profile.name, jsonEncode(profile.toMap()));
    _storage.write(StorageKeys.user.name, jsonEncode(user.toMap()));
    _storage.write(StorageKeys.session.name, jsonEncode(session.toMap()));
  }

  void saveProfile(Profile profile) {
    this.profile = profile;
    _storage.write(StorageKeys.profile.name, jsonEncode(profile.toMap()));
    update();
  }

  void clearUserdata() {
    profile = null;
    user = null;
    session = null;
    _storage.erase();
    Get.offAndToNamed(MyRoutes.signUp);
  }
}

enum StorageKeys { profile, user, session }
