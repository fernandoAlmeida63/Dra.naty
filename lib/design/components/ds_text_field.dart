import 'package:flutter/material.dart';
import '../tokens.dart';

class DsTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const DsTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.surface,
      ),
      style: AppTextStyles.body,
    );
  }
}
