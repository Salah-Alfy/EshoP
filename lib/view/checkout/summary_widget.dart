// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:eshop/helper/constance.dart';
import 'package:eshop/view/widgets/custom_text.dart';
import 'package:eshop/view_model/cart_view_model.dart';
import 'package:eshop/view_model/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: Get.height * .35,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    width: Get.width * .3,
                    child: Container(
                      width: Get.width * .3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width * .3,
                            height: Get.width * .3,
                            child: Image.network(
                              controller.cartProductModel[index].image,
                              fit: BoxFit.cover,
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RichText(
                              maxLines: 1,
                              text: TextSpan(
                                  text: controller.cartProductModel[index].name,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ))),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomText(
                            text:
                                "\$ ${controller.cartProductModel[index].price.toString()}",
                            color: primaryColor,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: controller.cartProductModel.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20.w,
                    );
                  },
                ),
              ),
              CustomText(
                text: "Shipping Adress",
                fontsize: 24.sp,
              ),
              SizedBox(height: 10.h),
              GetBuilder<CheckoutViewModel>(
                  builder: (controller) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * .75,
                            child: Text(
                              '${controller.street1 + " , " + controller.street2 + " , " + controller.city + " , " + controller.state + " , " + controller.country}',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: primaryColor,
                          )
                        ],
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
