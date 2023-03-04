import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathverse_app/bloc/comment/comment_bloc.dart';
import 'package:pathverse_app/bloc/comment/comment_event.dart';
import 'package:pathverse_app/bloc/comment/comment_state.dart';
import 'package:pathverse_app/helper/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathverse_app/widgets/custom_comment_body.dart';
import 'package:pathverse_app/widgets/error_screen.dart';
import 'package:pathverse_app/widgets/progress_indicator.dart';

class CommentsScreen extends StatefulWidget {
  static const route = '/CommentsScreen';

  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final String postId = Get.arguments.toString();
  late CommentBloc commentBloc;

  @override
  void initState() {
    commentBloc = CommentBloc(postId: postId);
    commentBloc.add(GetCommentList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Comments'),
      ),
      body: BlocProvider(
        create: (context) => commentBloc,
        child: BlocListener<CommentBloc, CommentState>(
          listener: (context, state) {
            if (state is CommentError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CommentBloc, CommentState>(
            builder: (context, state) {
              if (state is CommentInitial) {
                return const LoadingWidget();
              } else if (state is CommentLoading) {
                return const LoadingWidget();
              } else if (state is CommentLoaded) {
                return CustomCommentBody(commentList: state.commentList);
              } else if (state is CommentError) {
                return ErrorScreen(errorMessage: state.message!);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
