import 'package:flutter/material.dart';
import 'package:pathverse_app/helper/app_colors.dart';
import 'package:pathverse_app/helper/app_text.dart';
import 'package:pathverse_app/models/post.dart';
import 'package:pathverse_app/screens/comment_screen.dart';
import 'package:pathverse_app/screens/user_posts_screen.dart';
import 'package:get/get.dart';
import 'package:pathverse_app/widgets/custom_button.dart';
import 'package:readmore/readmore.dart';

class CustomPostCard extends StatelessWidget {
  final Post post;
  final bool isUserPostScreen;
  const CustomPostCard({
    Key? key,
    required this.post,
    required this.isUserPostScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      Get.toNamed(UserPostsScreen.route, arguments: post.id);
                    }
                  },
                  child: Container(
                    decoration: !isUserPostScreen
                        ? const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.blue),
                            ),
                          )
                        : null,
                    child: Text(
                      "ID: ${post.id}",
                      style: textH3,
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
                      Get.toNamed(CommentsScreen.route, arguments: post.id);
                    },
                  )
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'Title',
              style: text5,
            ),
            Text(
              post.title,
              style: text6,
            ),
            const SizedBox(height: 5),
            Text(
              'Description',
              style: text5,
            ),
            SizedBox(
              width: double.infinity,
              child: ReadMoreText(
                post.body,
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: ' Show less',
                lessStyle: text7,
                moreStyle: text7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
