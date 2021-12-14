// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, empty_constructor_bodies, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  String text;
  String leading;
  Icon trailing;
  VoidCallback onPressed;

  CustomListTile(
      {this.text = "",
      required this.leading,
      required this.trailing,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
          onPressed: onPressed,
          child: ListTile(
            title: CustomText(text: text),
            leading: Image.asset(leading) ,
            trailing: trailing,
          )),
    );
  }
}
