import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('HomeScreen'),
    );
  }
}
