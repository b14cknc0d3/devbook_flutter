import 'package:devbook/src/constant/color.dart';
import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/model/profile.dart';
import 'package:devbook/src/ui/chat/controller/create_room_controller.dart';
import 'package:devbook/src/ui/chat/conversation_page.dart';
import 'package:devbook/src/ui/profile/controller_get_all_profile.dart';
import 'package:devbook/src/widgets/circle_avator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseFriendPage extends StatelessWidget {
  const ChooseFriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreateRoomController rc = Get.put(CreateRoomController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Friend'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        backgroundColor: ColorPlatte.primaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(child: GetBuilder<GetAllProfileController>(
            builder: (controller) {
              return ListView.separated(
                separatorBuilder: ((context, index) => const Divider()),
                itemCount: controller.profileList.length,
                itemBuilder: ((context, index) {
                  final Profile profile = controller.profileList[index];
                  return ListTile(
                    onTap: () async {
                      await rc
                          .createRoom(profile)
                          .then((room) => Get.to(() => ConversationPage(
                                friendProfile: profile,
                                myProfile: Get.find<AuthController>().profile!,
                                room: room,
                              )));
                    },
                    leading: MyCircleAvator(
                      url: profile.profileImage.toString(),
                      // foregroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    title: Text(profile.user!.name),
                  );
                }),
              );
            },
          ))
        ],
      ),
    );
  }
}
