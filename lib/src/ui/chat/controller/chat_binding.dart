import 'package:devbook/src/ui/chat/controller/create_room_controller.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateRoomController());
  }
}
