import 'package:devbook/src/ui/profile/controller_get_all_profile.dart';
import 'package:get/get.dart';

class GetAllProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetAllProfileController());
  }
}
