import 'dart:async';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:devbook/src/api/appwrite_client.dart';
import 'package:devbook/src/constant/constant.dart';
import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/model/message.dart';
import 'package:devbook/src/model/room.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 0);
  final User? user = Get.find<AuthController>().user;
  final AppWriteClientController appWriteClientController =
      Get.find<AppWriteClientController>();

  final RxList<Message> _conversationListRx = RxList<Message>();
  List<Message> get conversationListRx => _conversationListRx;
  set conversationListRx(List<Message> value) =>
      _conversationListRx.value = value;
  final RxList<Room> _roomList = RxList<Room>();
  List<Room> get roomList => _roomList;
  set roomList(List<Room> value) => _roomList.value = value;

  StreamSubscription? subscription;

  @override
  onClose() {
    subscription?.cancel();
    super.onClose();
    _conversationListRx.clear();
  }

  Future<List<Room>> getRoomList() async {
    try {
      final response2 = await appWriteClientController.database!.listDocuments(
        collectionId: AppConstant.roomCollectionId,
        queries: [
          Query.equal(
            "to_user",
            user?.$id.toString(),
          )
        ],
        orderAttributes: ['createdAt'],
        orderTypes: ['DESC'],
      );
      final response3 = await appWriteClientController.database!.listDocuments(
        collectionId: AppConstant.roomCollectionId,
        queries: [
          Query.equal(
            "from_user",
            user?.$id.toString(),
          )
        ],
        orderAttributes: ['createdAt'],
        orderTypes: ['DESC'],
      );

      _roomList.clear();
      _roomList.value += RoomList.fromMap(response2).data;
      _roomList.value += RoomList.fromMap(response3).data;

      return _roomList;
    } on AppwriteException catch (e) {
      throw Exception(e);
    }
  }

  StreamSubscription getChatStreamByRoom(Room room) {
    return appWriteClientController.realtime!
        .subscribe(["collections.${AppConstant.messagsCollectionId}.documents"])
        .stream
        // .map((event) {
        //   Message x = Message.fromMap(event.payload);
        //   return x;
        // });
        .listen((event) {
          Message x = Message.fromMap(event.payload);
          if (x.roomId == room.roomId) {
            log("[TOTAL_MESSAGE] =>  ${_conversationListRx.length}");
            if (conversationListRx.isNotEmpty) {
              if (conversationListRx.last.$id != x.$id) {
                _conversationListRx.add(x);
              }
            }
          }

          // _conversationListRx.add(x);
        }, onError: (e) {
          print(e);
        }, onDone: () {
          print("done");
        });
  }

  // createTestChat() {
  //   try {
  //     print('creating test chat');
  //     appWriteClientController.database!.createDocument(
  //         collectionId: AppConstant.messagsCollectionId,
  //         documentId: AppConstant
  //             .docId, //TODO ADD CLOUD FUNCTION TO ADD COMMENT AND LIKE
  //         data: {
  //           'from_user': "62642f18019caf14b703",
  //           'to_user': '6262ad36d6712b640f05',
  //           'message': 'Hello ${Random().nextInt(100)}',
  //           'createdAt': DateTime.now().millisecondsSinceEpoch,
  //           'updatedAt': DateTime.now().millisecondsSinceEpoch,
  //           'room_id': '62642f18019caf14b703_6262ad36d6712b640f05',
  //         },
  //         read: [
  //           'role:member'
  //         ],
  //         // write: ['user:${Get.find<AuthController>().session!.userId}'],
  //         write: [
  //           'role:member'
  //         ]);
  //   } on AppwriteException catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<List<Message>> getMessageByRoom(String roomId) async {
    try {
      final response = await appWriteClientController.database!.listDocuments(
        collectionId: AppConstant.messagsCollectionId,
        queries: [
          Query.equal(
            "room_id",
            roomId,
          ),
        ],
        orderAttributes: ['createdAt'],
        orderTypes: ['DESC'],
      );

      final data = response.toMap();
      final documents = data['documents'].toList();
      log("[TOTAL_MESSAGE -future-] =>  ${documents.length}  ${data['total']}");
      List<Message> x = documents
          .map<Message>((Map<String, dynamic> e) => Message.fromMap(e['data']))
          .toList();
      conversationListRx = x.reversed.toList();
      return conversationListRx;
    } catch (e) {
      throw Exception(e);
    }
  }

  sendToConversation(Message message) async {
    print('sending message');

    try {
      final response = await appWriteClientController.database!.createDocument(
        collectionId: AppConstant.messagsCollectionId,
        documentId:
            AppConstant.docId, //TODO ADD CLOUD FUNCTION TO ADD COMMENT AND LIKE
        data: {
          'from_user': user?.$id.toString(),
          'to_user': message.toUser,
          'message': message.message,
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': DateTime.now().toIso8601String(),
          'room_id': message.roomId,
        },
        read: [
          // 'user:${message.toUser.toString()}',
          // 'user:${user?.$id.toString()}',
          'role:member',
        ],
        write: [
          'user:${user?.$id.toString()}',
          // 'user:${message.toUser.toString()}'
        ],
      );
      print('updating.... room');
      await appWriteClientController.database!.updateDocument(
        collectionId: AppConstant.roomCollectionId,
        documentId: message.roomId,
        data: {
          'last_message': message.message.length > 255
              ? message.message.substring(0, 255)
              : message.message,
          'updatedAt': DateTime.now().toUtc().toIso8601String(),
        },
      );
      // getMessageByRoom(message.roomId);
      print(response);
    } on AppwriteException catch (e) {
      throw Exception(e);
    }
  }
//   deleteAllMessage() async
// {
//   await appWriteClientController.database!.deleteDocument(
//     collectionId: AppConstant.messagsCollectionId,
//   );
// }
}
