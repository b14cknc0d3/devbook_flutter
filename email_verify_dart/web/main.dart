import 'dart:html';

import 'package:dart_appwrite/dart_appwrite.dart';

void main() async {
  // DivElement loader = DivElement();
  // loader.className = 'loader';
  // loader.innerHtml = '<div class="loader"></div>';
  // loader.classes.add('loader');
  // document.body?.append(loader);
  // querySelector('.loader')?.text = "";
  // print(loader.outerHtml);
  Map<String, dynamic> param = Uri.base.queryParameters;
  Client client = Client();
  Account account = Account(client);

  client.setEndpoint(
      "http://8080-b14cknc0d3-devbook-oxjjf47frf6.ws-us43.gitpod.io/v1");
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
