import 'package:flutter/material.dart';
import 'package:pathverse_app/bloc/post/post_bloc.dart';
import 'package:pathverse_app/bloc/post/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathverse_app/widgets/custom_post_list.dart';
import 'package:pathverse_app/widgets/error_screen.dart';
import 'package:pathverse_app/widgets/progress_indicator.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key? key,
    required this.postBloc,
  }) : super(key: key);

  final PostBloc postBloc;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => postBloc,
        child: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostInitial) {
                return const LoadingWidget();
              } else if (state is PostLoading) {
                return const LoadingWidget();
              } else if (state is PostLoaded) {
                return CustomPostList(
                  postList: state.postList,
                  isUserPostScreen: false,
                );
              } else if (state is PostError) {
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
