import 'dart:html';

import 'package:dart_appwrite/dart_appwrite.dart';

void main() async {
  Map<String, dynamic> param = Uri.base.queryParameters;
  Client client = Client();
  Account account = Account(client);

  client.setEndpoint("https://172.104.188.52/v1");
  client.setProject("626bf9d15135604e68ce");
  document.body?.children
      .removeWhere((element) => element.className == "loader");
  if (param.containsKey("userId") || param.containsKey("secret")) {
    await account
        .updateVerification(userId: param['userId'], secret: param['secret'])
        .then((response) {
      querySelector("#output")?.text = "✅ Verification Success!";
    }).catchError((e) {
      querySelector("#output")?.text = "❌ Verification failed ❌";
    });
  } else {
    querySelector("#output")?.text = "ℹ️ Missing userId or secret ℹ️";
  }
}
