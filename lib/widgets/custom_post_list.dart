import 'package:flutter/material.dart';
import 'package:pathverse_app/helper/app_colors.dart';
import 'package:pathverse_app/models/post.dart';
import 'package:pathverse_app/screens/comment_screen.dart';
import 'package:pathverse_app/screens/user_posts_screen.dart';
import 'package:pathverse_app/widgets/custom_button.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';

class CustomPostList extends StatelessWidget {
  final List<Post> postList;
  final bool isUserPostScreen;
  const CustomPostList({
    Key? key,
    required this.postList,
    required this.isUserPostScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: ListView.builder(
        itemCount: postList.length,
        itemBuilder: ((context, index) {
          final post = postList[index];
          return Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (!isUserPostScreen) {
                            Get.toNamed(UserPostsScreen.route,
                                arguments: post.id);
                          }
                        },
                        child: Container(
                          decoration: !isUserPostScreen
                              ? const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.blue),
                                  ),
                                )
                              : null,
                          child: Text(
                            "ID: ${post.id}",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      if (isUserPostScreen)
                        CustomButton(
                          customWidth: 110,
                          primaryColor: secondaryColor,
                          buttonText: 'Comments',
                          elevation: 1,
                          textColor: Colors.white,
                          onTap: () {
                            Get.toNamed(CommentsScreen.route,
                                arguments: post.id);
                          },
                        )
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ReadMoreText(
                    post.body,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Show less',
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
