import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pathverse_app/helper/app_colors.dart';
import 'package:pathverse_app/helper/list_pagination.dart';
import 'package:pathverse_app/widgets/custom_post_card.dart';
import 'package:pathverse_app/models/post.dart';

class CustomPostList extends StatefulWidget {
  final List<Post> postList;
  final bool isUserPostScreen;
  const CustomPostList({
    Key? key,
    required this.postList,
    required this.isUserPostScreen,
  }) : super(key: key);

  @override
  State<CustomPostList> createState() => _CustomPostListState();
}

class _CustomPostListState extends State<CustomPostList> {
  //* Pagination List Number of item
  final int _numOfItems = 20;
  late final _numOfPages = widget.postList.numOfPages(_numOfItems);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Post> subList =
        widget.postList.paginate(page: _currentPage, numOfItems: _numOfItems);

    final child = Container(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Column(
          children: subList.map((post) {
            return CustomPostCard(
                post: post, isUserPostScreen: widget.isUserPostScreen);
          }).toList(),
        ),
      ),
    );

    return !widget.isUserPostScreen
        ? Scaffold(
            body: child,
            bottomNavigationBar: NumberPaginator(
              numberPages: _numOfPages,
              onPageChange: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              config: const NumberPaginatorUIConfig(
                buttonSelectedBackgroundColor: primaryColor,
              ),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(25),
            itemCount: widget.postList.length,
            itemBuilder: ((context, index) {
              final post = widget.postList[index];
              return CustomPostCard(
                  post: post, isUserPostScreen: widget.isUserPostScreen);
            }),
          );
  }
}
