import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pathverse_app/screens/comment_screen.dart';
import 'package:pathverse_app/screens/home_screen.dart';
import 'package:pathverse_app/screens/login_screen.dart';
import 'package:pathverse_app/screens/user_posts_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: HomeScreen(),

      // home: LoginScreen(),

      getPages: [
        GetPage(
            name: HomeScreen.route,
            page: () => HomeScreen(),
            transition: Transition.fade),
        GetPage(
            name: LoginScreen.route,
            page: () => LoginScreen(),
            transition: Transition.fade),
        GetPage(
            name: UserPostsScreen.route,
            page: () => UserPostsScreen(),
            transition: Transition.fade),
        GetPage(
            name: CommentsScreen.route,
            page: () => CommentsScreen(),
            transition: Transition.fade),
      ],
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
    );
  }
}
