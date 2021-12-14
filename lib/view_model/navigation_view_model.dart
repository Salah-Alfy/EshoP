// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:eshop/view/screens/cart_view.dart';
import 'package:eshop/view/screens/home_view.dart';
import 'package:eshop/view/screens/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationViewModel extends GetxController {
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;

  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;

  void chaneSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = CartView();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
