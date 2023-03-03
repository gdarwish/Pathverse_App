import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pathverse_app/bloc/post/post_bloc.dart';
import 'package:pathverse_app/bloc/post/post_event.dart';
import 'package:pathverse_app/bloc/post/post_state.dart';
import 'package:pathverse_app/helper/app_colors.dart';
import 'package:pathverse_app/screens/login_screen.dart';
import 'package:pathverse_app/widgets/error_screen.dart';
import 'package:pathverse_app/widgets/custom_post_list.dart';
import 'package:pathverse_app/widgets/progress_indicator.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:get/get.dart';

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

class CustomAppSideBar extends StatelessWidget {
  final SidebarXController controller = SidebarXController(selectedIndex: 0);

  CustomAppSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      headerDivider: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Image.asset('assets/images/logo2.png'),
      ),
      extendedTheme: const SidebarXTheme(
        width: 150,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      controller: controller,
      theme: const SidebarXTheme(
        iconTheme: IconThemeData(color: Colors.white),
        textStyle: TextStyle(color: Colors.white),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
        ),
      ],
      footerItems: [
        SidebarXItem(
            icon: Icons.output_rounded,
            label: 'Sign Out',
            onTap: () {
              Get.toNamed(LoginScreen.route);
            }),
      ],
    );
  }
}
