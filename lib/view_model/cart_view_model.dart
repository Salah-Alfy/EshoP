// ignore_for_file: prefer_final_fields

import 'package:eshop/model/cart_product_model.dart';
import 'package:eshop/service/DataBase/cart_database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProduct;
    _loading.value = false;
    getTotalPrice();

    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += double.parse(
          _cartProductModel[i].price * _cartProductModel[i].quantity);
      update();
    }
  }

  addProductToCartView(CartProductModel model) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == model.productId) {
        return;
      }
    }
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(model);
    _cartProductModel.add(model);
    _totalPrice += double.parse(model.price * model.quantity);

    update();
  }

  increasQuantity(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity + 1;
    _totalPrice += double.parse(_cartProductModel[index].price);
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.updateProduct(_cartProductModel[index]);

    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity - 1;
    _totalPrice -= double.parse(_cartProductModel[index].price);
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.updateProduct(_cartProductModel[index]);
    if (_cartProductModel[index].quantity <= 0) {
      increasQuantity(index);
    }
    update();
  }
}
