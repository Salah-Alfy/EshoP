// ignore_for_file: unnecessary_overrides, prefer_final_fields, unused_field, unused_local_variable, prefer_typing_uninitialized_variables, avoid_print, import_of_legacy_library_into_null_safe, unused_import, unnecessary_null_comparison, prefer_if_null_operators

import 'package:eshop/helper/local_storage_data.dart';
import 'package:eshop/model/user_model.dart';
import 'package:eshop/service/firestore_user.dart';
import 'package:eshop/view/screens/control_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password, name;

  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());

    if (_auth.currentUser != null) {
      //لو اليوزر مسجل دخول بتبعت للميثود الرقم بتاعه يسجله في الشيرد
      getCurrentUser(_auth.currentUser!.uid);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignInMethod() async {
    //save google account to use it in auth the next step
    final GoogleSignInAccount? user = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await user!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    await _auth.signInWithCredential(credential).then((value) async {
      saveUserToFireStore(value);
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        getCurrentUser(value.user!.uid);
      });
      Get.offAll(ControlView());
    } on Exception catch (e) {
      print(e);
      Get.snackbar("Error in Login", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccount() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        saveUserToFireStore(value);
        //saveUserToFireStore this method created to avoid redundut
      });
      Get.offAll(ControlView());
    } on Exception catch (e) {
      print(e);
      Get.snackbar("Error in Login", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

//must add this method in signin with google and facebook
  void saveUserToFireStore(UserCredential value) async {
    UserModel userModel = UserModel(
        userId: value.user!.uid,
        email: value.user!.email,
        name: name == null ? value.user!.displayName : name,
        pic: "");
    await FirestoreUser().addUserToFireStor(userModel);

    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    //save user to sharedPrefs
    await localStorageData.setUser(userModel);
  }

  void getCurrentUser(String uId) async {
    //get user from shared prefs
    await FirestoreUser()
        .getCurrentUser(uId)
        .then((value) => {setUser(UserModel.fromJson(value.data()as Map<dynamic,dynamic>))});
  }
}
