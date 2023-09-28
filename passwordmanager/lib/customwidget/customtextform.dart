// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  TextInputType? keyboard;
  Function(String)? onchanged;
  String? Function(String?)? validation;
  String hint;
  Iterable<String>? autofills;
  Widget icon;
  bool? obstruct;
  Widget? widget;
  TextEditingController? controller;
  VoidCallback? ontap;
  CustomTextFormField({
    Key? key,
    required this.hint,
    this.obstruct,
    this.onchanged,
    this.ontap,
    this.keyboard,
    this.autofills,
    this.validation,
    required this.icon,
    this.widget,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      onTap: ontap,
      autofillHints: autofills,
      validator: validation,
      obscureText: obstruct ?? false,
      controller: controller,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          hintText: hint,
          prefixIcon: icon,
          suffixIcon: widget),
    );
  }
}
