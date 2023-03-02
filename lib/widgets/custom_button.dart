import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color primaryColor;
  final String buttonText;
  final double elevation;
  final Color textColor;
  final Function() onTap;
  final double? customWidth;
  const CustomButton({
    Key? key,
    required this.primaryColor,
    required this.buttonText,
    required this.elevation,
    required this.textColor,
    required this.onTap,
    this.customWidth = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: customWidth != 0
          ? customWidth
          : MediaQuery.of(context).size.width - 80,
      height: 35,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: onTap,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
