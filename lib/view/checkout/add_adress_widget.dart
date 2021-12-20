// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:eshop/helper/constance.dart';
import 'package:eshop/view/widgets/custom_textformfeild.dart';
import 'package:eshop/view_model/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      builder: (controller) => Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding:  EdgeInsets.all(20.0.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Text(
                           "Billing adress is the same as delivery adress",
                           style: TextStyle(color: Colors.black,fontSize: 18.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTFF(
                    onSaved: (value) {
                      controller.street1 = value;
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "You must write your street";
                      }
                    },
                    text: "Street 1",
                    hint: "21 Alex Davidson Avenue",
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTFF(
                    onSaved: (value) {
                      controller.street2 = value;
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "You must write your street";
                      }
                    },
                    text: "Street 2",
                    hint: "21 Alex Davidson Avenue",
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTFF(
                    onSaved: (value) {
                      controller.city = value;
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "You must write your city";
                      }
                    },
                    text: "City",
                    hint: "Victoria Island",
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                      width: Get.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:  EdgeInsets.only(right: 10.w),
                              child: CustomTFF(
                                onSaved: (value) {
                                  controller.state = value;
                                },
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "You must write your state";
                                  }
                                },
                                text: "State",
                                hint: "Lagos State",
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:  EdgeInsets.only(left: 10.w),
                              child: CustomTFF(
                                onSaved: (value) {
                                  controller.country = value;
                                },
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "You must write your country";
                                  }
                                },
                                text: "Country",
                                hint: "Holand",
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
