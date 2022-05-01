import 'package:devbook/src/model/post.dart';
import 'package:devbook/src/widgets/circle_avator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        // height: post.body.length < 200
        //     ? Get.height > 600
        //         ? MediaQuery.of(context).size.height * 0.22
        //         : MediaQuery.of(context).size.height * 0.4
        //     : MediaQuery.of(context).size.height * 0.4,
        color: Colors.white,
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                tileColor: Colors.white,
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: MyCircleAvator(
                    url: post.author.profileImage.toString(),
                  ),
                ),
                title: Text(post.author.user!.name + "@dev",
                    style: GoogleFonts.poppins()),
                subtitle: Row(
                  children: [
                    Text(timeago.format(post.createdAt, locale: 'en_short')),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(Icons.public),
                  ],
                ),
                trailing: const Icon(Icons.more_vert),
              ),
              // const Divider(
              //   color: Colors.white,
              // ),
              Expanded(
                  // height: MediaQuery.of(context).size.width * 0.1,
                  child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4),
                  child: Text(
                    post.body,
                  ),
                ),
              )),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.favorite_border, color: Colors.red),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(post.likesCount.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.comment, color: Colors.indigo),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(post.commentsCount.toString()),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.share, color: Colors.indigo),
                          SizedBox(
                            width: 2,
                          ),
                          Text("1"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
