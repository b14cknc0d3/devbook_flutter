import 'dart:async';

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
  final User? user = Get.find<AuthController>().user;
  final AppWriteClientController appWriteClientController =
      Get.find<AppWriteClientController>();
  final AuthController _authController = Get.find<AuthController>();

  final RxList<Message> _conversationListRx = RxList<Message>();
  List<Message> get conversationListRx => _conversationListRx;

  final RxList<Room> _roomList = RxList<Room>();
  List<Room> get roomList => _roomList;
  set roomList(List<Room> value) => _roomList.value = value;
  // @override
  // onInit() {
  //   super.onInit();

  // }

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

  Stream<Message> getChatStreamByRoom(Room room) {
    return appWriteClientController.realtime!
        .subscribe([
          "collections.${AppConstant.messagsCollectionId}.documents.${room.roomId}"
        ])
        .stream
        .map((event) {
          Message x = Message.fromMap(event.payload);
          return x;
        });
    // .listen((event) {
    //   Message x = Message.fromMap(event.payload);
    //   _conversationListRx.add(x);
    // });
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
        orderTypes: ['ASC'],
      );

      final data = response.toMap();
      final documents = data['documents'].toList();
      _conversationListRx.value = documents
          .map<Message>((Map<String, dynamic> e) => Message.fromMap(e['data']))
          .toList();
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
      getMessageByRoom(message.roomId);
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

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}
