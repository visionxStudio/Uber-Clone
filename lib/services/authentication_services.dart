import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uberclone/controllers/Auth_controller.dart';

class AuthenticationServices {
  final firestoreInstance = FirebaseFirestore.instance;
  final AuthController _authController = Get.put(AuthController());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signupUserWithEmailAndPassword() async {
    _authController.toggleLoadingState();
    _auth
        .createUserWithEmailAndPassword(
      email: _authController.email.value,
      password: _authController.password.value,
    )
        .then((response) async {
      await firestoreInstance.collection("users").add({
        "name": _authController.fullName.value,
        "email": _authController.email,
        "mobile": _authController.phoneNumber,
        // "id": firestoreInstance.collection("users").id
      }).then((response) {
        Get.snackbar(
          "Success",
          "Successfully Signed up",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        _authController.toggleLoadingState();
      });
    }).catchError((error) {
      print(error.message);
      Get.snackbar("Error Occured", error.message,
          colorText: Colors.red, snackPosition: SnackPosition.BOTTOM);
      _authController.toggleLoadingState();
    });
  }
}
