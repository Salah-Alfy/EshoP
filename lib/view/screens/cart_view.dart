// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:eshop/helper/constance.dart';
import 'package:eshop/view/checkout/checkout_view.dart';
import 'package:eshop/view/widgets/custom_button.dart';
import 'package:eshop/view/widgets/custom_text.dart';
import 'package:eshop/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => controller.cartProductModel.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * .2,
                          child: Row(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Image.network(
                                    controller.cartProductModel[index].image,
                                    fit: BoxFit.fill,
                                  )),
                              Padding(
                                padding:  EdgeInsets.only(left: 30.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        "${controller
                                            .cartProductModel[index].name}",
                                            style: TextStyle(color:Colors.black,fontSize:25.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    CustomText(
                                      text:
                                          "\$ ${controller.cartProductModel[index].price}",
                                      color: primaryColor,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding:  EdgeInsets.all(8.0.w),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .increasQuantity(index);
                                                },
                                                child: Icon(Icons.add)),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            CustomText(
                                              text: controller
                                                  .cartProductModel[index]
                                                  .quantity
                                                  .toString(),
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .decreaseQuantity(index);
                                                },
                                                child: Icon(Icons.minimize)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: controller.cartProductModel.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ]),
                  child: Padding(
                    padding:  EdgeInsets.only(
                        left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: "TOTAL",
                              fontsize: 22.sp,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomText(
                              text: "\$ ${controller.totalPrice}",
                              fontsize: 18.sp,
                              color: primaryColor,
                            ),
                          ],
                        ),
                        CustomButton(
                          onPressed: () {
                            Get.to(CheckoutView());
                          },
                          text: "Checkout",
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/empty_cart.svg",
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.width * .5,
                ),
                SizedBox(height: 20,),
                CustomText(
                    text: "Cart is Empty",
                    fontweight: FontWeight.bold,
                    alignment: Alignment.center)
              ],
            ),
    ));
  }
}
