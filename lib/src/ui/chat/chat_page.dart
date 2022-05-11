import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/model/room.dart';
import 'package:devbook/src/ui/chat/choose_friend.dart';
import 'package:devbook/src/ui/chat/controller/chat_controller.dart';
import 'package:devbook/src/ui/chat/conversation_page.dart';
import 'package:devbook/src/ui/profile/get_all_profile_binding.dart';
import 'package:devbook/src/widgets/circle_avator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final x = Get.put(ChatController())..getRoomList();

    // ..createTestChat();
    //from_user
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () => x.getRoomList(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Expanded(
                  child: ListView.separated(
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(left: 64.0),
                  child: Divider(
                    color: Colors.transparent,
                    thickness: 1,
                  ),
                ),
                itemCount: x.roomList.length,
                itemBuilder: (context, index) {
                  final Room room = x.roomList[index];
                  // print(room.toMap());
                  ///is owner of room from_user == from_user
                  ///to_user = to_user
                  ///from_user = to_user
                  ///to_user = from_user
                  bool isOwnerOfRoom = room.fromUser ==
                      Get.find<AuthController>().user!.$id.toString();
                  // assert(room.toUserProfile.user!.id.isNotEmpty);
                  return ListTile(
                    // hoverColor: Colors.grey[200],
                    focusColor: Colors.grey,
                    onTap: (() => Get.to(() => ConversationPage(
                          friendProfile: isOwnerOfRoom
                              ? room.toUserProfile
                              : room.fromUserProfile,
                          myProfile: isOwnerOfRoom
                              ? room.fromUserProfile
                              : room.toUserProfile,
                          room: room,
                        ))),
                    leading: MyCircleAvator(
                      url: isOwnerOfRoom
                          ? room.toUserProfile.profileImage.toString()
                          : room.fromUserProfile.profileImage.toString(),
                    ),
                    title: Text(
                        isOwnerOfRoom
                            ? room.toUserProfile.user!.name
                            : room.fromUserProfile.user!.name,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                    subtitle: Text(room.lastMessage ?? ""),
                    trailing: Text(timeago.format(room.updatedAt)),
                  );
                },
              ));
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => const ChooseFriendPage(),
            binding: GetAllProfileBinding(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
