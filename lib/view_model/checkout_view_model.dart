import 'package:eshop/helper/constance.dart';
import 'package:eshop/helper/enum.dart';
import 'package:eshop/view/screens/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  int _index = 0;
  int get index => _index;

  Pages _pages = Pages.DeliveryTime;
  Pages? get pages => _pages;

  String street1 = "", street2 = "", city = "", state = "", country = "";

  GlobalKey<FormState> formState = GlobalKey();

  void changeIndex(int i) {
    if (i == 0 || i < 0) {
      _pages = Pages.DeliveryTime;
      _index = i;
    } else if (i == 1) {
      _pages = Pages.AddAddress;
      _index = i;
    } else if (i == 2) {
      formState.currentState!.save();
      if (formState.currentState!.validate()) {
        _pages = Pages.Summary;
        _index = i;
      }
    } else if (i == 3) {
      Get.to(ControlView());
      _index = 0;
      _pages = Pages.DeliveryTime;
    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }
}
