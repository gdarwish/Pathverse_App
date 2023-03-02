import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pathverse_app/bloc/post/post_bloc.dart';
import 'package:pathverse_app/bloc/post/post_event.dart';
import 'package:pathverse_app/bloc/post/post_state.dart';
import 'package:pathverse_app/models/post.dart';
import 'package:pathverse_app/widgets/home_widget.dart';
import 'package:pathverse_app/widgets/progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(GetPostList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
                  return HomeWidget(postList: state.postList);
                } else if (state is PostError) {
                  return Text(state.message.toString());
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
