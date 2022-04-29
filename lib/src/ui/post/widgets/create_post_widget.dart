import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/ui/post/create_post/create_post_page.dart';
import 'package:devbook/src/widgets/circle_avator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: MyCircleAvator(
            url: Get.find<AuthController>().profile!.profileImage.toString(),
          ),
          title: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        () => const CreatePostPage(),
                        transition: Transition.downToUp,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.grey[200]!,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Post your question",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.actor()
                              .copyWith(fontSize: 20, color: Colors.indigo),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
