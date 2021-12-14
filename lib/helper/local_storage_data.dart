// ignore_for_file: unnecessary_null_comparison, avoid_print, unused_local_variable

import 'dart:convert';

import 'package:eshop/model/user_model.dart';
import 'package:eshop/helper/constance.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
    }
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
    //CACHED_USER_DATA is variable in constance
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = prefs.getString(CACHED_USER_DATA);
    return UserModel.fromJson(jsonDecode(value!));
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
