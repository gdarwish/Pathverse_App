import 'package:flutter/material.dart';
import 'package:pathverse_app/bloc/user-post/user_post_bloc.dart';
import 'package:get/get.dart';
import 'package:pathverse_app/bloc/user-post/user_post_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathverse_app/bloc/user-post/user_post_state.dart';
import 'package:pathverse_app/helper/app_colors.dart';
import 'package:pathverse_app/widgets/error_screen.dart';
import 'package:pathverse_app/widgets/custom_post_list.dart';
import 'package:pathverse_app/widgets/progress_indicator.dart';

class UserPostsScreen extends StatefulWidget {
  static const route = '/UserPostsScreen';

  const UserPostsScreen({super.key});

  @override
  State<UserPostsScreen> createState() => _UserPostsScreenState();
}

class _UserPostsScreenState extends State<UserPostsScreen> {
  final String userId = Get.arguments.toString();
  late UserPostBloc userPostBloc;

  @override
  void initState() {
    userPostBloc = UserPostBloc(userId: userId);
    userPostBloc.add(GetUserPostList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('User Posts'),
      ),
      body: BlocProvider(
        create: (context) => userPostBloc,
        child: BlocListener<UserPostBloc, UserPostState>(
          listener: (context, state) {
            if (state is UserPostError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<UserPostBloc, UserPostState>(
            builder: (context, state) {
              if (state is UserPostInitial) {
                return const LoadingWidget();
              } else if (state is UserPostLoading) {
                return const LoadingWidget();
              } else if (state is UserPostLoaded) {
                return CustomPostList(
                  postList: state.userPostList,
                  isUserPostScreen: true,
                );
              } else if (state is UserPostError) {
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
