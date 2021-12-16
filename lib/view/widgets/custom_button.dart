// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers

import 'package:eshop/helper/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomButton(
      {Key? key,
      this.text = "",
      required this.onPressed,
      this.color = primaryColor,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: FlatButton(
        onPressed: onPressed,
        color: color,
        padding: EdgeInsets.all(20.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: BorderSide(color: primaryColor)),
        child: CustomText(
          text: text,
          fontsize: 14.sp,
          color: textColor,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
