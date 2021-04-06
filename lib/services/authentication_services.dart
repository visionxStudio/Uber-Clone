import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uberclone/controllers/Auth_controller.dart';

class AuthenticationServices {
  final AuthController _authController = Get.put(AuthController());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signupUserWithEmailAndPassword() async {
    _authController.toggleLoadingState();
    _auth
        .createUserWithEmailAndPassword(
      email: _authController.email.value,
      password: _authController.password.value,
    )
        .catchError((error) {
      print(error.message);
      Get.snackbar("Error Occured", error.message,
          snackPosition: SnackPosition.BOTTOM);
    }).whenComplete(() {
      _authController.toggleLoadingState();
    });
  }
}
