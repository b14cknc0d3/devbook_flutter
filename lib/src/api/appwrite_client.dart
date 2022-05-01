import 'package:appwrite/appwrite.dart';
import 'package:devbook/src/constant/constant.dart';

import 'package:get/get.dart';

class AppWriteClientController extends GetxController {
  Client client = Client();
  Database? database;
  Realtime? realtime;
  Account? account;

  @override
  void onInit() {
    client.setEndpoint(AppConstant.endpoint);
    client.setProject(AppConstant.projectId);
    client.setSelfSigned(status: true);
    database = Database(client);
    realtime = Realtime(client);
    account = Account(client);

    super.onInit();
  }
}
