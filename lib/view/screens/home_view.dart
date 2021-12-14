// ignore_for_file: use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, unused_import, must_be_immutable, prefer_final_fields, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:eshop/view/auth/login_view.dart';
import 'package:eshop/view/screens/details_view.dart';
import 'package:eshop/view/widgets/custom_text.dart';
import 'package:eshop/view_model/home_view_model.dart';
import 'package:eshop/view_model/navigation_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(      
      builder: (controller) =>controller.loading.value?
      Center(child:CircularProgressIndicator(color: Color.fromRGBO(0, 197, 105, 1),)):
       Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: AppBar().preferredSize.height, left: 20, right: 20),
            child: Column(
              children: [
                searchTextFormFeild(),
                SizedBox(
                  height: 40,
                ),
                CustomText(
                    text: "Categories",
                    fontsize: 20,
                    fontweight: FontWeight.bold),
                SizedBox(
                  height: 20,
                ),
                categoriesListView(),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Best Selling",
                      fontsize: 20,
                      fontweight: FontWeight.bold,
                    ),
                    CustomText(text: "See All"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                productsListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchTextFormFeild() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none, prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  Widget categoriesListView() {
    return GetBuilder<HomeViewModel>(
      builder: (controller)=>
       Container(
        height: 100,
        child: ListView.separated(
            itemCount: controller.categoryModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(controller.categoryModel[index].image),
                    ),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(text: controller.categoryModel[index].name),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 20,
                )),
      ),
    );
  }

  Widget productsListView() {
    return GetBuilder<HomeViewModel>(
      builder: (controller)=>
       Container(
        height: 350,
        child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.to(DetailsView(model: controller.productModel[index]));
                },
                child: Container(
                  height:MediaQuery.of(context).size.height* 0.2 ,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          child: Image.network(controller.productModel[index].image),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: controller.productModel[index].name,
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: controller.productModel[index].desc,
                        color: Colors.black26,
                        fontsize: 14,
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: controller.productModel[index].price,
                        alignment: Alignment.bottomLeft,
                        color: Color.fromRGBO(0, 197, 105, 1),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 20,
                )),
      ),
    );
  }

    

}
