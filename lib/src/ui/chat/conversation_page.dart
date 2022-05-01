import 'package:devbook/src/constant/color.dart';
import 'package:devbook/src/model/message.dart';
import 'package:devbook/src/model/profile.dart';
import 'package:devbook/src/model/room.dart';
import 'package:devbook/src/ui/chat/controller/chat_controller.dart';
import 'package:devbook/src/widgets/circle_avator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class ConversationPage extends StatelessWidget {
  final Profile friendProfile;
  final Profile myProfile;
  final Room room;
  final ChatController chatController = Get.find<ChatController>();
  ConversationPage({
    Key? key,
    required this.friendProfile,
    required this.myProfile,
    required this.room,
  }) : super(key: key) {
    chatController.getMessageByRoom(room.roomId);
  }

  @override
  Widget build(BuildContext context) {
    chatController.subscription = chatController.getChatStreamByRoom(room);

    // chatController.getMessageByRoom(room.roomId);
    // String friName = message?.fromUser ?? 'User';

    // x.getMessageByRoom(message!.roomId);

    return Scaffold(
        // backgroundColor: Colors.indigo,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorPlatte.primaryColor,
          leadingWidth: MediaQuery.of(context).size.width,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                splashRadius: null,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
              MyCircleAvator(
                url: friendProfile.profileImage.toString(),
              ),
            ],
          ),
          title: Text(friendProfile.user!.name),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert_outlined),
              onPressed: () {},
            )
          ],
        ),
        // ignore: sized_box_for_whitespace
        body: Column(
          children: [
            Expanded(child: Obx(() {
              return ListView.separated(
                reverse: true,
                controller: chatController.scrollController,
                separatorBuilder: (context, i) => const Padding(
                  padding: EdgeInsets.only(left: 64.0),
                  child: Divider(
                    color: Colors.transparent,
                    thickness: 1,
                  ),
                ),
                itemCount: chatController.conversationListRx.length,
                itemBuilder: (context, i) {
                  final reversedIndex =
                      chatController.conversationListRx.length - 1 - i;
                  final Message message =
                      chatController.conversationListRx[reversedIndex];

                  if (message.fromUser == myProfile.id) {
                    return SendMessageWidget(
                        message: message.message,
                        imageURL: myProfile.profileImage.toString(),
                        date: message.createdAt);
                  } else {
                    return ReceivedMessageWidget(
                        message: message.message,
                        imageURL: friendProfile.profileImage.toString(),
                        date: message.createdAt);
                  }
                },
              );
            })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: chatController.messageController,
                        // onChanged: (value) {
                        //   chatController.messageController;
                        // },
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      color: Colors.indigo,
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        if (chatController.messageController.text.isNotEmpty) {
                          print("""
 fromUser: ${myProfile.$id.toString()},
                              toUser: ${friendProfile.$id.toString()},
""");
                          Message message = Message(
                              fromUser: myProfile.user!.id.toString(),
                              toUser: friendProfile.user!.id.toString(),
                              message: chatController.messageController.text,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                              roomId: room.roomId);

                          chatController.sendToConversation(message);
                          chatController.messageController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class ReceivedMessageWidget extends StatelessWidget {
  final String message;
  final String imageURL;
  final DateTime date;
  const ReceivedMessageWidget(
      {Key? key,
      required this.message,
      required this.imageURL,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 64,
            top: 8.0,
            left: 4,
          ),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 100,
            ),
            decoration: BoxDecoration(
              color: Colors.amber[300],
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
            ),
            // ignore: avoid_unnecessary_containers
            child: Stack(
              // fit: StackFit.passthrough,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, left: 8.0, top: 8.0, bottom: 15.0),
                          child: Text(message),
                        )
                      ]),
                    )
                  ],
                ),
                Positioned(
                  bottom: 2,
                  right: 10,
                  child: Text(
                    timeago.format(date),
                    style: TextStyle(
                        fontSize: 10, color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SendMessageWidget extends StatelessWidget {
  final String message;
  final String imageURL;
  final DateTime date;
  const SendMessageWidget(
      {Key? key,
      required this.message,
      required this.imageURL,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 4,
            top: 8.0,
            left: 64,
          ),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 100,
            ),
            decoration: const BoxDecoration(
              color: ColorPlatte.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
            ),
            // ignore: avoid_unnecessary_containers
            child: Stack(
              // fit: StackFit.passthrough,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, left: 8.0, top: 8.0, bottom: 15.0),
                          child: Text(
                            message,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
                Positioned(
                  bottom: 2,
                  right: 10,
                  child: Text(
                    timeago.format(date),
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
