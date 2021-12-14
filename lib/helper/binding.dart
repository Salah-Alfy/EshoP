import 'package:eshop/helper/local_storage_data.dart';
import 'package:eshop/view_model/auth_view_model.dart';
import 'package:eshop/view_model/cart_view_model.dart';
import 'package:eshop/view_model/checkout_view_model.dart';
import 'package:eshop/view_model/home_view_model.dart';
import 'package:eshop/view_model/navigation_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthViewModel>(() => AuthViewModel());
    Get.lazyPut<NavigationViewModel>(() => NavigationViewModel());
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
    Get.lazyPut<CartViewModel>(() => CartViewModel());
    Get.lazyPut<CheckoutViewModel>(() => CheckoutViewModel());
    Get.lazyPut<LocalStorageData>(() => LocalStorageData());
  }
}
