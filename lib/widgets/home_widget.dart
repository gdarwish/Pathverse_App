import 'package:flutter/material.dart';
import 'package:pathverse_app/models/post.dart';

class HomeWidget extends StatelessWidget {
  final List<Post> postList;
  const HomeWidget({
    Key? key,
    required this.postList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: postList.length,
        itemBuilder: ((context, index) {
          final post = postList[index];
          return Column(
            children: [
              Text(post.title),
              Text(post.body),
              Text(post.id.toString()),
            ],
          );
        }),
      ),
    );
  }
}
