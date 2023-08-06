// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  Color backgroundcolor;
  VoidCallback onpressed;
  CustomButton({
    Key? key,
    required this.text,
    required this.backgroundcolor,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: backgroundcolor),
          onPressed: onpressed,
          child: Text(text)),
    );
  }
}
