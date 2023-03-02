import 'package:flutter/material.dart';
import 'package:pathverse_app/screens/home_screen.dart';
import 'package:pathverse_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      // home: const LoginScreen(),
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
      },
    );
  }
}
