// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eshop/view/auth/login_view.dart';
import 'package:eshop/view_model/auth_view_model.dart';
import 'package:eshop/view_model/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<NavigationViewModel>(
            init: NavigationViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<NavigationViewModel>(
        builder: (controller) => BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      label: "",
                      icon: Image.asset("assets/images/Icon_Explore.png"),
                      activeIcon: Text("Explore")),
                  BottomNavigationBarItem(
                      label: "",
                      icon: Image.asset("assets/images/Icon_Cart.png"),
                      activeIcon: Text("Cart")),
                  BottomNavigationBarItem(
                      label: "",
                      icon: Image.asset("assets/images/Icon_person.png"),
                      activeIcon: Text("Account"))
                ],
                currentIndex: controller.navigatorValue,
                onTap: (index) {
                  controller.chaneSelectedValue(index);
                },
                elevation: 8,
                selectedItemColor: Colors.black,
                backgroundColor: Colors.grey.shade50));
  }
}
