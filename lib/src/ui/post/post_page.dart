import 'package:devbook/src/ui/post/widgets/create_post_controller.dart';
import 'package:devbook/src/ui/post/widgets/create_post_widget.dart';
import 'package:devbook/src/ui/post/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreatePostController controller = Get.put(CreatePostController());
    controller.getPost();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 1), () {
          Get.find<CreatePostController>().getPost();
        }),
        child: Column(
          children: [
            const CreatePostWidget(),
            // const Divider(),
            GetBuilder<CreatePostController>(builder: (controller) {
              return Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.transparent,
                  ),
                  itemCount: controller.postList.length,
                  itemBuilder: (context, index) {
                    return PostWidget(
                      post: controller.postList[index],
                    );
                  },
                ),
              );
            }),
            // const Divider(),
          ],
        ),
      ),
    );
  }
}
