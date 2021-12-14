// ignore_for_file: unused_import, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors
// @dart=2.9

import 'package:eshop/helper/binding.dart';
import 'package:eshop/view/auth/login_view.dart';
import 'package:eshop/view/screens/control_view.dart';
import 'package:eshop/view_model/cart_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      home: Scaffold(
        body: ControlView(),
      ),
    );
    
  }
}
