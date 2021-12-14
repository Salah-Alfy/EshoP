// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_final_fields

import 'package:eshop/helper/local_storage_data.dart';
import 'package:eshop/model/user_model.dart';
import 'package:eshop/view/auth/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  LocalStorageData localStorageData = Get.find();

  UserModel? get userModel => _userModel;
  UserModel? _userModel;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) => {_userModel = value});
    _loading.value = false;
    update();
    
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
    Get.offAll(LoginScreen());
  }
}
