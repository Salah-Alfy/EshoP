// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_types_as_parameter_names, avoid_print

import 'package:eshop/view/widgets/custom_button.dart';
import 'package:eshop/view/widgets/custom_textformfeild.dart';
import 'package:eshop/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black54,),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding:  EdgeInsets.only( right: 20.w, left: 20.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SIGNUP,",
                      style:
                          TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                 CustomTFF(
                  text: "Name",
                  hint: "@dav",
                  onSaved: (Value) {
                    controller.name = Value;
                  },
                  validator: (Value) {
                     if (Value == null) {
                      print("error");
                    }
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTFF(
                  text: "Email",
                  hint: "imdav@gmail.com",
                  onSaved: (Value) {
                    controller.email = Value;
                  },
                  validator: (Value) {
                    if (Value == null) {
                      print("error");
                    }
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTFF(
                  obsecure: true,
                  text: "Password",
                  hint: "********",
                  onSaved: (Value) {
                    controller.password = Value;
                  },
                  validator: (Value) {
                    if (Value == null) {
                      print("error");
                    }
                  },
                ),
                SizedBox(height: 50.h),
                CustomButton(
                  onPressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.createAccount();
                    }
                  },
                  text: "SIGN UP",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}