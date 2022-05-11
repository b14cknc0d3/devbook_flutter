import 'package:appwrite/appwrite.dart';
import 'package:devbook/src/api/appwrite_client.dart';
import 'package:devbook/src/constant/constant.dart';
import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/model/profile.dart';
import 'package:get/get.dart';

class GetAllProfileController extends GetxController {
  final AppWriteClientController appWriteClientController =
      Get.find<AppWriteClientController>();

  @override
  onInit() {
    super.onInit();
    getAllProfile();
  }

  List<Profile> profileList = <Profile>[];

  getAllProfile() async {
    print("getting all profile");
    try {
      final res = await appWriteClientController.database!.listDocuments(
          collectionId: AppConstant.profileCollectionId,
          queries: [
            Query.notEqual('id', Get.find<AuthController>().user!.$id),
            //TODO EMAIL VERIFICATION NEEDED
            ///linode ban smpt port
            ///
            // Query.equal('verified', true)
          ]);
      print(res.toMap());
      profileList = ProfileDocumentList.fromMap(res).data;

      profileList.removeWhere(
          (element) => element.$id == Get.find<AuthController>().user!.$id);
      update();
    } catch (e) {
      throw Exception(e);
    }
  }
}
