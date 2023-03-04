import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final double? width;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.validator,
    this.obscureText = false,
    this.width,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 300,
      child: TextFormField(
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
