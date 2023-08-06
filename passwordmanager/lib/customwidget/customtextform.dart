// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:passwordmanager/utilities/colors.dart';

class CustomTextFormField extends StatelessWidget {
  String hint;
  Widget icon;
  Widget? widget;
  TextEditingController controller;
  CustomTextFormField({
    Key? key,
    required this.hint,
    required this.icon,
    this.widget,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 183, 131, 183),
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          hintText: hint,
          prefixIcon: icon,
          suffixIcon: widget),
    );
  }
}
