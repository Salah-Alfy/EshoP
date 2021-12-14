// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/model/user_model.dart';

class FirestoreUser {
  //make a new collection in fire store collection is table
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("users");

  Future<void> addUserToFireStor(UserModel userModel) async {
    await _userCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await _userCollectionRef.doc(uid).get();
  }
}
