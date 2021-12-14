// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names, deprecated_member_use, use_key_in_widget_constructors, avoid_print

import 'package:eshop/view/auth/register_view.dart';
import 'package:eshop/view/widgets/custom_button.dart';
import 'package:eshop/view/widgets/custom_socialb.dart';
import 'package:eshop/view/widgets/custom_text.dart';
import 'package:eshop/view/widgets/custom_textformfeild.dart';
import 'package:eshop/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.only(top: AppBar().preferredSize.height, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome,",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                          text: "Sign Up",
                          fontsize: 18,
                          color: Color.fromRGBO(0, 197, 105, 1)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Sign in to continue",
                  fontsize: 14,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 50,
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
                  height: 40,
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
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Forget Password?",
                  fontsize: 14,
                  color: Colors.black,
                  alignment: Alignment.topRight,
                ),
                SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                  text: "SIGN IN",
                ),
                SizedBox(height: 20),
                CustomText(
                  text: "-OR-",
                  color: Colors.black,
                  fontsize: 16,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 20),
                CustomSocial(
                  onPressed: () {},
                  text: "Sign In With Facebook",
                  image: "assets/images/Facebook.png",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomSocial(
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                  text: "Sign In With Google",
                  image: "assets/images/Google.png",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
