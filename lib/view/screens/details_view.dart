// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, must_be_immutable, avoid_unnecessary_containers

import 'package:eshop/model/cart_product_model.dart';
import 'package:eshop/model/product_model.dart';
import 'package:eshop/helper/constance.dart';
import 'package:eshop/view/screens/control_view.dart';
import 'package:eshop/view/widgets/custom_button.dart';
import 'package:eshop/view/widgets/custom_text.dart';
import 'package:eshop/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;
  DetailsView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .25,
              child: Image.network(model.image, fit: BoxFit.fill)),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    CustomText(
                      text: model.name,
                      fontsize: 26,
                      fontweight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .45,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade200)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Size",
                              ),
                              CustomText(text: model.size),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .45,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade200)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Color",
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                    color: model.color),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: "Details",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: model.detail,
                      fontsize: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(text: "PRICE", color: Colors.grey.shade700),
                    CustomText(
                      text: model.price,
                      color: primaryColor,
                      fontsize: 18,
                    ),
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: CartViewModel(),
                  builder: (controller) => Container(
                      width: MediaQuery.of(context).size.width * .3,
                      child: CustomButton(
                        onPressed: () {
                          controller.addProductToCartView(CartProductModel(
                            name: model.name,
                            image: model.image,
                            price: model.price,
                            quantity: 1,
                            productId: model.productId,
                          ));
                          Get.snackbar("Your Product Added to cart",model.name);
                          Get.to(ControlView());
                        },
                        text: "Add",
                      )),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
