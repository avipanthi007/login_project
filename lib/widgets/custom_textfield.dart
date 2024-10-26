import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final hintText;
  final maxLines;
  final maxLength;
  final keyboardType;
  final bool? obsecureText;
  final Widget? prefix;
  final Widget? suffix;

  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.maxLines,
      this.maxLength,
      this.keyboardType,
      this.suffix,
      this.prefix,
      this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter $hintText";
        }
      },
      maxLength: maxLength,
      keyboardType: keyboardType,
      obscureText: obsecureText ?? false,
      maxLines: maxLines,
      controller: controller,
      decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: hintText,suffixIcon: suffix,prefixIcon: prefix),
    );
  }
}
