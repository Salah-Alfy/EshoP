// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';

class CustomTFF extends StatelessWidget {
  final String text;
  final String hint;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  bool obsecure;
  

  CustomTFF({this.text="", this.hint="", required this.onSaved, required this.validator,this.obsecure=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(text: text, fontsize: 14.sp, color: Colors.grey.shade900),
          TextFormField(
            obscureText:obsecure ,
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
