// ignore_for_file: file_names, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSocial extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onPressed;

  const CustomSocial(
      {Key? key, this.text = "", this.image = "", required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(20),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.grey.shade300)),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Image.asset(image),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: text,
              )
            ],
          ),
        ],
      ),
    );
  }
}
