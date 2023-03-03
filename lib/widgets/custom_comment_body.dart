import 'package:flutter/material.dart';
import 'package:pathverse_app/helper/app_text.dart';

import 'package:pathverse_app/models/comment.dart';
import 'package:readmore/readmore.dart';

class CustomCommentBody extends StatelessWidget {
  final List<Comment> commentList;
  const CustomCommentBody({
    Key? key,
    required this.commentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: ListView.builder(
        itemCount: commentList.length,
        itemBuilder: ((context, index) {
          final comment = commentList[index];
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
                      Text(
                        "ID: ${comment.id}",
                        style: textH3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Name',
                    style: text5,
                  ),
                  Text(
                    comment.name,
                    style: text6,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Email',
                    style: text5,
                  ),
                  Text(
                    comment.email,
                    style: text6,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Comment',
                    style: text5,
                  ),
                  ReadMoreText(
                    comment.body,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Show less',
                    lessStyle: text7,
                    moreStyle: text7,
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
