import 'package:flutter/material.dart';

import 'package:pathverse_app/bloc/post/post_bloc.dart';
import 'package:pathverse_app/bloc/post/post_event.dart';
import 'package:pathverse_app/widgets/custom_appside_bar.dart';
import 'package:pathverse_app/widgets/home_screen_body.dart';

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
      body: Row(
        children: [
          //* SideBar
          CustomAppSideBar(),
          //* screen body
          HomeScreenBody(postBloc: postBloc),
        ],
      ),
    );
  }
}
