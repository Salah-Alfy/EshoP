// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontsize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontweight;

  CustomText(
      {this.text = "",
      this.fontsize = 16,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.fontweight=FontWeight.normal
      });

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: alignment,
      child: Text(
        text!,
        style: TextStyle(color: color, fontSize: fontsize,fontWeight: fontweight, ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
    ));
  }
}
