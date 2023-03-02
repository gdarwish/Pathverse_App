import 'package:flutter/material.dart';

import 'package:pathverse_app/helper/app_colors.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  const ErrorScreen({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning, size: 45, color: secondaryColor),
          const SizedBox(height: 5),
          Text(
            errorMessage,
            style: const TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}
