import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customtile extends StatelessWidget {
  String? title;
  String? subtitle;
  Widget? leading;
  Widget? trailing;
  VoidCallback? ontap;
  Customtile(
      {this.ontap,
      this.leading,
      this.trailing,
      this.title,
      this.subtitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: ontap,
        trailing: trailing,
        leading: leading,
        subtitle: subtitle != null ? Text(subtitle!) : null,
        title: title != null
            ? Text(
                title!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              )
            : null,
      ),
    );
  }
}
