import 'package:appwrite/appwrite.dart';
import 'package:devbook/src/api/appwrite_client.dart';
import 'package:devbook/src/constant/constant.dart';
import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/model/profile.dart';
import 'package:devbook/src/model/room.dart';
import 'package:get/get.dart';

class CreateRoomController extends GetxController {
  final AppWriteClientController appWriteClientController =
      Get.find<AppWriteClientController>();

  final String userId = Get.find<AuthController>().user!.$id.toString();

  Future<Room> createRoom(Profile friendProfile) async {
    Room room = Room(
      fromUser: userId,
      toUser: friendProfile.$id.toString(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      toUserProfile: friendProfile,
      fromUserProfile: Get.find<AuthController>().profile!,
    );
    try {
      final x = await appWriteClientController.database!.createDocument(
        collectionId: AppConstant.roomCollectionId,
        documentId: room.toMap()['room_id'],
        data: room.toMap(),
        // read: ['user:$friendId', 'user:$userId'],
        //TODO: changed role to from cloud function
        read: ['role:member'],
        write: ['role:member'],
        // write: ['role:member']
      );
      Map<String, dynamic> data = x.data;
      return Room.fromMap(data);
    } on AppwriteException catch (_) {
      rethrow;
    } catch (e) {
      throw Exception(e);
    }
  }
}
