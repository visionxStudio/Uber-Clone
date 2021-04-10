import 'package:get/get.dart';

class AuthController extends GetxController {
  var isloginState = true.obs;
  var email = "".obs;
  var password = "".obs;
  var fullName = "".obs;
  var phoneNumber = "".obs;
  var isLoading = false.obs;

  void toggleLoadingState() {
    isLoading(!isLoading.value);
    update();
  }
}
