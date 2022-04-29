import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/ui/post/widgets/create_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreatePostController controller = Get.put(CreatePostController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask a question"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text("POST"),
              onPressed: () {
                controller.createPost();
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          const ProfileListTile(),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(),
            ),
            child: TextField(
              controller: controller.textEditingController,
              maxLength: null,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "What's your question?",
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        // radius: 30,
        child: Image.network(
            Get.find<AuthController>().profile!.profileImage.toString()),
      ),
      title: Text(
        Get.find<AuthController>().profile!.user!.name,
        style: GoogleFonts.aBeeZee().copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Row(
        children: const [Icon(Icons.public_outlined)],
      ),
    );
  }
}
