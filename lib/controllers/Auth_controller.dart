import 'package:get/get.dart';

class AuthController extends GetxController {
  var isloginState = true.obs;
  var email = "mail@mail.com".obs;
  var password = "password".obs;
  var fullName = "Full Name".obs;
  var phoneNumber = "9800918289".obs;
  var isLoading = false.obs;

  void toggleLoadingState() {
    isLoading(!isLoading.value);
  }
}
