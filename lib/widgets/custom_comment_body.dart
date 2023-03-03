import 'package:flutter/material.dart';

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
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    comment.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    comment.email,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Comment',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ReadMoreText(
                    comment.body,
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
