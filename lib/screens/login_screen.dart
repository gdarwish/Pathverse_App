import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/LoginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('LoginScreen'),
        ],
      ),
    );
  }
}
