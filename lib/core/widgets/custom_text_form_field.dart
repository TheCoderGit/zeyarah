import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType textType;
  final String hintLabel;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintLabel,
    this.isPassword = false,
    this.textType = TextInputType.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      keyboardType: textType,
      obscureText: isPassword,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), hintText: hintLabel),
      controller: controller,
    );
  }
}
