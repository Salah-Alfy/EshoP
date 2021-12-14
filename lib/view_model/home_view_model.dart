// ignore_for_file: prefer_final_fields

import 'package:eshop/model/category_model.dart';
import 'package:eshop/model/product_model.dart';
import 'package:eshop/service/home_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

//constructor that make the method when instance
  HomeViewModel() {
    getCategory();
    getBestSelling();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()as Map<dynamic,dynamic>));
      }
      _loading.value = false;
      update();
    });
  }

  getBestSelling() async {
    _loading.value = true;
    HomeService().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()as Map<dynamic,dynamic>));
      }
      _loading.value = false;
      update();
    });
  }
}
